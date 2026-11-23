<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<!doctype html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Ingresar · MusicAI</title>
  <link rel="stylesheet" href="${base}/css/login.css">
</head>
<body>
  <main class="login-screen">
    <div class="decorative-bg" aria-hidden="true"></div>
    <header class="brand">
      <div class="brand__logo" aria-hidden="true">&#9834;</div>
      <p class="brand__name">Music<span class="brand__accent">AI</span></p>
    </header>
    <section class="login-card" aria-labelledby="heading">
      <h1 id="heading" class="login-card__title">Ingresar</h1>
      <p class="login-card__subtitle">Ingreso académico simulado. Usa un dato ficticio y evita tus contraseñas reales</p>
      <p class="form-error" role="alert" ${empty generalError ? 'hidden' : ''}>${generalError}</p>
      <form class="login-form" method="post" action="${base}/pages/ingresar">
        <div class="form-group">
          <label for="email">Correo electrónico</label>
          <div class="input-wrapper">
            <input id="email" name="email" type="text" inputmode="email" autocomplete="email"
                   maxlength="254" class="input-wrapper__field" value="${email}" data-email
                   aria-invalid="${not empty emailError}" aria-describedby="email-error" required>
          </div>
          <p class="field-error" id="email-error">${emailError}</p>
        </div>
        <div class="form-group">
          <label for="password">Contraseña</label>
          <div class="input-wrapper">
            <input id="password" type="password" class="input-wrapper__field" autocomplete="off" required>
            <button type="button" id="toggle-password" class="toggle-password"
                    aria-controls="password" aria-pressed="false">Mostrar</button>
          </div>
        </div>
        <button type="submit" class="btn-primary">Ingresar</button>
      </form>
      <p class="signup-prompt" ${invite ? '' : 'hidden'}>
        ¡Regístrate y comienza a aprender armonía con MusicAI!
        <a class="signup-link" href="${base}/pages/registrar">Regístrate ahora</a>
      </p>
    </section>
  </main>
  <script src="${base}/js/login.js" defer></script>
</body>
</html>
