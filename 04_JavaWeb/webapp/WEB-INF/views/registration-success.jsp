<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<!doctype html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>¡Registro exitoso! · MusicAI</title>
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
      <h1 id="heading" class="login-card__title">¡Registro exitoso!</h1>
      <p class="login-card__subtitle" role="status">Redirigiendo...</p>
      <div class="registration-progress" aria-hidden="true"></div>
      <div id="registration-success" data-home="${base}/pages/home.html" hidden></div>
    </section>
  </main>
  <script src="${base}/js/registration-success.js" defer></script>
</body>
</html>
