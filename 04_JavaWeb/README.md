# MusicAI Java Web

Módulo académico para GA7-220501096-AA2-EV01 y GA7-220501096-AA2-EV02. El registro escribe seis campos en SQL Server mediante JDBC. El ingreso académico consulta si el correo existe y permite continuar a Home/Ruta. Cualquier contraseña ficticia no vacía satisface el control del navegador. El campo carece de atributo `name`, el servidor solo recibe el correo y una solicitud directa puede consultar la existencia sin pasar por el formulario. Home admite acceso directo y la respuesta de ingreso permite distinguir correos registrados.

La base técnica es `85f6ff717c2bb2ae23ac8a9ca09760f766990c25` y el commit de activación es `bd266f70fc7083ee704551069c1e4ac83c20163c`. El contrato vigente describe la evidencia administrativa disponible y las responsabilidades de ForgeBE, Sentinel y Juan Carlos.

## Compilación

Se requiere JDK 21, PowerShell y acceso de lectura a `lib/servlet-api.jar` de la distribución aprobada de Tomcat 10.1. Desde la raíz del repositorio:

```powershell
./04_JavaWeb/build.ps1 -TomcatHome '<ruta de Tomcat>'
# Alternativa con una copia legible de la misma API de Tomcat
./04_JavaWeb/build.ps1 -ServletApiJar '<ruta legible a servlet-api.jar>'
```

`-JdkHome` permite indicar un JDK distinto de `JAVA_HOME`. Si la política local restringe archivos PS1, Juan Carlos puede ejecutar el comando con una política aprobada para el proceso. El resultado esperado es `build/musicai.war`, junto con `musicai.war.inventory.txt` y `musicai.war.sha256` bajo el mismo directorio. Comparar dos hashes de compilaciones consecutivas sobre las mismas fuentes.

```powershell
$d = '04_JavaWeb/src/musicai/registration'
$t = '04_JavaWeb/build/test-classes'
New-Item -ItemType Directory -Force $t | Out-Null
javac --release 21 -encoding UTF-8 -d $t "$d/StudentRegistration.java" "$d/RegistrationValidator.java" "$d/HtmlEscaper.java" "$d/StudentDao.java" 04_JavaWeb/test/musicai/registration/RegistrationChecks.java
if ($LASTEXITCODE -ne 0) { throw 'Falló javac' }
java -cp $t musicai.registration.RegistrationChecks
if ($LASTEXITCODE -ne 0) { throw 'Fallaron las pruebas' }
```

## Recorrido por archivo

| Archivo | Flujo y responsabilidad |
| --- | --- |
| `.gitignore` | Ignora los derivados bajo `04_JavaWeb/build/`. |
| `02_Source/pages/login.html` | Presenta la bienvenida y enlaza a los servlets con rutas relativas, conservando el contexto de Tomcat. |
| `02_Source/css/login.css` | Reutiliza la marca y la tarjeta del prototipo. Añade indicación de error, estilo de los enlaces y animación de confirmación con preferencia de movimiento reducido. |
| `02_Source/js/login.js` | Aplica en ambas vistas la regla de correo también validada en servidor. En ingreso alterna la visibilidad de la contraseña. |
| `src/musicai/registration/RegistrationServlet.java` | GET crea el token CSRF y presenta el formulario. POST acepta exclusivamente el formulario URL-encoded, limita el cuerpo real a 8192 bytes, rechaza datos mal formados o repetidos, verifica CSRF, normaliza, valida y pide el INSERT. Los errores de campo conservan el valor escapado. Una escritura confirmada emite 303 y deja una confirmación sin PII, con vigencia de 60 segundos y consumo sincronizado. La vista confirmada se obtiene por GET. El servlet comparte controles HTTP con ingreso y configura SameSite al inicializar el contexto. |
| `src/musicai/registration/LoginServlet.java` | GET presenta la vista y POST procesa el correo. Una consulta positiva emite 303 a Home. Ausencia, error de formato y fallo técnico tienen respuestas distintas. |
| `src/musicai/registration/StudentRegistration.java` | Contiene los seis valores de registro usados por el DAO. |
| `src/musicai/registration/RegistrationValidator.java` | Recorta espacios externos, comprueba presencia, formatos y límites UTF-16. Conserva capitalización, ceros y separadores admitidos. Los caracteres suplementarios se excluyen mientras no exista evidencia de compatibilidad con la intercalación física. |
| `src/musicai/registration/StudentDao.java` | Usa el DataSource JNDI, una conexión por operación y cierre automático JDBC. El INSERT usa seis parámetros Unicode y comprueba autocommit y una fila afectada. La consulta usa CallableStatement y exige exactamente una columna BIT `StudentExists` y una fila no nula. La clasificación de duplicidad exige el código SQL y un prefijo conocido del diagnóstico con objeto y restricción o índice; otros diagnósticos generan un fallo general. La localización efectiva debe comprobarse con Tomcat/SQL Server. |
| `src/musicai/registration/HtmlEscaper.java` | Codifica metacaracteres de texto y, para atributos entre comillas, codifica también comillas y espacios de control. Las vistas reciben valores ya codificados para cada destino. |
| `webapp/WEB-INF/views/register.jsp` | Renderiza los seis campos en el orden del contrato y un token técnico oculto. Muestra el error debajo de cada campo. |
| `webapp/WEB-INF/views/login.jsp` | Presenta el aviso académico, el control de contraseña local y el enlace de invitación cuando la consulta devuelve ausencia. |
| `webapp/WEB-INF/views/registration-success.jsp` | Renderiza los textos de éxito, la barra y la ruta fija de Home para el script. |
| `webapp/js/registration-success.js` | Espera tres segundos y reemplaza la entrada actual del historial con Home. |
| `webapp/WEB-INF/web.xml` | Registra las tres rutas, declara `jdbc/MusicAI` y limita la sesión temporal a cookies HttpOnly. Tomcat deriva Path del contexto y marca Secure cuando reconoce HTTPS. Los atributos efectivos requieren inspección en navegador. |
| `build.ps1` | Valida herramientas y rutas, prepara staging bajo `build/`, detecta colisiones y puntos de reanálisis, compila contra la API de Tomcat y empaqueta con fecha normalizada. Compara el inventario de archivos y genera SHA-256. |
| `test/musicai/registration/RegistrationChecks.java` | Ejecuta casos de obligatoriedad, fronteras, Unicode, formatos, escape y diagnóstico de duplicidad con Java estándar y valores ficticios. |

## Integración y operación

Juan Carlos despliega el WAR bajo `/musicai` con Tomcat detenido y el descriptor JNDI externo existente. Verifica el inventario antes de copiar, compara el SHA-256 antes y después y verifica las ACL del WAR con `Get-Acl` o `icacls`. El contrato exige Tomcat10 RX, SYSTEM y Administradores F, con Administradores como propietario. Tras iniciar el servicio, abre `http://127.0.0.1:8080/musicai/pages/login.html`. Usar datos ficticios. Juan Carlos verifica filas, permisos efectivos y conectividad con el token del servicio en SSMS y controla cualquier intervención para pruebas de fallos o TLS.

La instalación externa debe proporcionar el recurso `java:comp/env/jdbc/MusicAI`, el driver JDBC y DLL aprobados y la conexión integrada de Windows con `encrypt=strict`. La cuenta de servicio utiliza INSERT sobre la tabla y EXECUTE sobre el procedimiento. La consulta depende de la cadena de propiedad de los objetos. Revisar la evidencia del servicio real para permisos directos, NTLM, TCP, cifrado y TDS 8.0. Si aparece un conflicto de runtime, objeto o permisos, aplicar las condiciones de parada del contrato.

El despliegue remoto requiere autorización específica, revisión independiente y un túnel privado HTTPS al puerto aislado de MusicAI. Juan Carlos comprueba acceso nominativo, rechazo anónimo y de cuentas ajenas, aislamiento de otros contextos, cookies Secure/HttpOnly/SameSite=Lax con Path del contexto y el flujo de POST y 303 por HTTPS. La ventana debe acordarse y, al cierre, se detiene el host y se revoca el acceso con comprobación externa. SQL Server opera en loopback.

## Evidencia de Fase 1

| Criterios | Estado observado | Procedimiento y responsable |
| --- | --- | --- |
| TA-04, TA-05, TA-06 | PENDIENTE integración. Las comprobaciones Java del validador pasaron. | ForgeBE ejecutó `RegistrationChecks`. Falta probar POST y verificar conservación en SQL Server. |
| TA-18 | PENDIENTE renderizado. Las comprobaciones Java de escape pasaron. | ForgeBE ejecutó `RegistrationChecks`. Falta comprobar el HTML renderizado. |
| TA-23 | Build e inventario verificados por ForgeBE. Juan Carlos confirmó la coincidencia de hashes y las ACL del WAR desplegado. | ForgeBE ejecutó `build.ps1 -ServletApiJar <copia legible>`, comparó hashes y revisó el inventario. La evidencia administrativa del WAR vigente figura abajo. |
| TA-25 | `PASS: 62 checks.` | Sentinel ejecutó satisfactoriamente `RegistrationChecks`. |
| TA-01–03, TA-07–17, TA-19–22 y TA-24 | NO EJECUTADO en el runtime. | Juan Carlos despliega y controla las operaciones administrativas. ForgeBE registra las observaciones de integración y Sentinel revisa la evidencia. |
| TR-01–08 | NO EJECUTADO. | Juan Carlos y Sentinel tras la autorización específica de la publicación. |

ForgeBE verificó que el SHA-256 de la API de Servlet suministrada coincidiera con `65AF18F76934A43768E61549E67A1310E8E7829616A9451C3F23E0ED16C0F4C4`. Como antecedente de reproducibilidad, el WAR generado en dos ejecuciones de Fase 1 tuvo SHA-256 `192480CFDE1BCC0EE91C3F73F9BA1DD7B627B0265F336A8BA76D51D8C75C365E`. La API se usó en el classpath de compilación y el inventario del WAR contiene cero JAR.

Juan Carlos verificó que el WAR local y el desplegado comparten el SHA-256 vigente `C505D76F33944E49B37146856476692016215AE8F0A09044CA8DED89C202FD61`. Confirmó como propietario a `BUILTIN\Administradores` y verificó los permisos `ReadAndExecute` para `NT SERVICE\Tomcat10` y `FullControl` para `NT AUTHORITY\SYSTEM` y `BUILTIN\Administradores`.

ForgeBE ejecutó diez comprobaciones de JavaScript mediante Node y un DOM simulado para validar el correo y la llamada de redirección a los tres segundos. También verificó la sintaxis de ambos JavaScript con `node --check`, la lectura de `web.xml` como XML, el análisis sintáctico de PowerShell y el diff con `git diff --check`.

Por decisión de Juan Carlos, los cuatro SQL históricos autorizados se difieren hasta después de entregar EV01 y EV02. El procedimiento almacenado vigente y la integración JDBC funcionan según los resultados comunicados. Quedan por recuperar originales de migración y permisos. La trazabilidad y reproducibilidad del historial se documentarán con los originales recuperados y su evidencia de ejecución.
