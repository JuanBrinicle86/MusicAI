param(
    [string]$JdkHome = $env:JAVA_HOME,
    [string]$TomcatHome = $env:CATALINA_HOME,
    [string]$ServletApiJar
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

function Get-RegularItem([string]$Path, [bool]$Directory) {
    $item = Get-Item -LiteralPath $Path -Force -ErrorAction Stop
    if (($item.Attributes -band [IO.FileAttributes]::ReparsePoint) -or
        $item.PSIsContainer -ne $Directory) {
        throw "Unexpected file type or reparse point: $Path"
    }
    return $item
}

function Get-TreeEntries([string]$Root, [string]$Prefix = '') {
    foreach ($item in Get-ChildItem -LiteralPath $Root -Force) {
        if ($item.Attributes -band [IO.FileAttributes]::ReparsePoint) {
            throw "Reparse point is outside the supported build inventory: $($item.FullName)"
        }
        $relative = $Prefix + $item.Name
        [pscustomobject]@{ Relative = $relative; Item = $item }
        if ($item.PSIsContainer) {
            Get-TreeEntries $item.FullName ($relative + '/')
        }
    }
}

function Invoke-Tool([string]$Tool, [string[]]$Arguments) {
    & $Tool @Arguments
    if ($LASTEXITCODE -ne 0) {
        throw "$Tool returned exit code $LASTEXITCODE"
    }
}

if (-not $JdkHome) { throw 'Set JAVA_HOME or pass -JdkHome pointing to JDK 21.' }
if (-not $ServletApiJar) {
    if (-not $TomcatHome) { throw 'Pass -TomcatHome or -ServletApiJar from the approved Tomcat.' }
    $ServletApiJar = Join-Path $TomcatHome 'lib/servlet-api.jar'
}
$javac = (Get-RegularItem (Join-Path $JdkHome 'bin/javac.exe') $false).FullName
$jar = (Get-RegularItem (Join-Path $JdkHome 'bin/jar.exe') $false).FullName
$api = (Get-RegularItem $ServletApiJar $false).FullName
$version = Invoke-Tool -Tool $javac -Arguments @('-version')
if ($version -notmatch '^javac 21(?:\.|$)') { throw "Expected JDK 21. Found $version" }

$module = (Get-RegularItem $PSScriptRoot $true).FullName
$source = (Get-RegularItem (Join-Path (Split-Path -Parent $module) '02_Source') $true).FullName
$overlay = (Get-RegularItem (Join-Path $module 'webapp') $true).FullName
$java = (Get-RegularItem (Join-Path $module 'src') $true).FullName
$staticEntries = @(Get-TreeEntries $source)
$overlayEntries = @(Get-TreeEntries $overlay)
$sources = @(Get-TreeEntries $java | Where-Object { -not $_.Item.PSIsContainer })
if ($sources.Count -ne 6 -or @($sources | Where-Object { $_.Relative -notmatch '\.java$' }).Count) {
    throw 'Expected exactly the six authorized .java files in src.'
}
$expectedOverlay = @(
    'WEB-INF/views/register.jsp', 'WEB-INF/views/login.jsp',
    'WEB-INF/views/registration-success.jsp', 'WEB-INF/web.xml', 'js/registration-success.js'
)
$overlayFiles = @($overlayEntries | Where-Object { -not $_.Item.PSIsContainer } |
    ForEach-Object { $_.Relative })
if (Compare-Object $expectedOverlay $overlayFiles -CaseSensitive) {
    throw 'Unexpected webapp file inventory.'
}

$inventory = @{}
foreach ($entry in $staticEntries) {
    if ($entry.Relative -match '^WEB-INF(?:/|$)') { throw '02_Source contains reserved WEB-INF.' }
    if ($inventory.ContainsKey($entry.Relative)) { throw "Duplicate path: $($entry.Relative)" }
    $inventory[$entry.Relative] = $entry.Item.PSIsContainer
}
foreach ($entry in $overlayEntries) {
    $relative = $entry.Relative
    if ($inventory.ContainsKey($relative) -and
        (-not $inventory[$relative] -or -not $entry.Item.PSIsContainer)) {
        throw "Collision between 02_Source and webapp: $relative"
    }
    $inventory[$relative] = $entry.Item.PSIsContainer
}
foreach ($relative in $inventory.Keys) {
    if ($relative -match '(?i)(^|/)(META-INF|test|build)(/|$)|\.(jar|dll|pem|sql|ps1|java|class|pfx|p12|jks|key|crt|cer|war)$|(^|/)context\.xml$') {
        throw "Prohibited WAR entry: $relative"
    }
}

$build = Join-Path $module 'build'
# Check even dangling links before creating or cleaning a destination.
$existing = @(Get-ChildItem -LiteralPath $module -Force | Where-Object { $_.Name -ieq 'build' })
if (-not $existing.Count) { [void](New-Item -ItemType Directory -Path $build) }
$build = (Get-RegularItem $build $true).FullName
$stage = Join-Path $build 'staging'
$war = Join-Path $build 'musicai.war'
$sha = Join-Path $build 'musicai.war.sha256'
$index = Join-Path $build 'musicai.war.inventory.txt'

$derivatives = @{ 'staging' = $true; 'musicai.war' = $false;
    'musicai.war.sha256' = $false; 'musicai.war.inventory.txt' = $false }
foreach ($item in Get-ChildItem -LiteralPath $build -Force) {
    if ($derivatives.ContainsKey($item.Name)) {
        [void](Get-RegularItem $item.FullName $derivatives[$item.Name])
        if ($item.PSIsContainer) {
            $null = @(Get-TreeEntries $item.FullName)
        }
    }
}
foreach ($leaf in $derivatives.Keys) {
    $path = [IO.Path]::GetFullPath((Join-Path $build $leaf))
    if (-not $path.StartsWith($build + [IO.Path]::DirectorySeparatorChar,
            [StringComparison]::OrdinalIgnoreCase)) {
        throw "Refusing to clean outside build: $path"
    }
    if (Test-Path -LiteralPath $path) { Remove-Item -LiteralPath $path -Recurse -Force }
}

[void](New-Item -ItemType Directory -Path $stage)
foreach ($entry in ($staticEntries + $overlayEntries)) {
    $destination = Join-Path $stage $entry.Relative
    if ($entry.Item.PSIsContainer) {
        [void](New-Item -ItemType Directory -Force -Path $destination)
    } else {
        Copy-Item -LiteralPath $entry.Item.FullName -Destination $destination
    }
}
$classes = Join-Path $stage 'WEB-INF/classes'
[void](New-Item -ItemType Directory -Path $classes)
$compilerArgs = @('--release', '21', '-encoding', 'UTF-8', '-classpath', $api, '-d', $classes)
$compilerArgs += @($sources | ForEach-Object { $_.Item.FullName })
Invoke-Tool -Tool $javac -Arguments $compilerArgs

$expectedClasses = @(
    'RegistrationServlet.class', 'LoginServlet.class', 'StudentRegistration.class',
    'RegistrationValidator.class', 'StudentDao.class', 'HtmlEscaper.class'
) | ForEach-Object { "WEB-INF/classes/musicai/registration/$_" }
$expected = @($inventory.Keys | Where-Object { -not $inventory[$_] }) + @($expectedClasses)

# The normalized ZIP timestamp makes repeated builds from identical inputs comparable.
Invoke-Tool -Tool $jar -Arguments @('--create', '--file', $war, '--no-manifest',
    '--date=2000-01-01T00:00:00Z', '-C', $stage, '.')
$actual = @(Invoke-Tool -Tool $jar -Arguments @('--list', '--file', $war) |
    Where-Object { -not $_.EndsWith('/') })
if (Compare-Object $expected $actual -CaseSensitive) {
    Remove-Item -LiteralPath $war
    throw 'Unexpected WAR inventory. Rejected the generated archive.'
}
$actual | Sort-Object | Set-Content -LiteralPath $index -Encoding UTF8
$hash = (Get-FileHash -LiteralPath $war -Algorithm SHA256).Hash
"$hash  musicai.war" | Set-Content -LiteralPath $sha -Encoding ASCII
Write-Output "$war"
Write-Output "SHA-256 $hash"
