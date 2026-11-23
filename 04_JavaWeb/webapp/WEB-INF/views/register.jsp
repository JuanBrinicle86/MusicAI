<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<!doctype html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Registrarse · MusicAI</title>
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
      <h1 id="heading" class="login-card__title">Registrarse</h1>
      <p class="form-error" role="alert" ${empty generalError ? 'hidden' : ''}>${generalError}</p>
      <form class="login-form" method="post" action="${base}/pages/registrar">
        <input type="hidden" name="csrf" value="${csrf}">
        <div class="form-group">
          <label for="documentNumber">Documento de identidad</label>
          <div class="input-wrapper">
            <input class="input-wrapper__field" type="text" id="documentNumber" name="documentNumber"
                   value="${values.documentNumber}" maxlength="30"
                   aria-invalid="${not empty errors.documentNumber}" aria-describedby="documentNumber-error" required>
          </div>
          <p class="field-error" id="documentNumber-error">${errors.documentNumber}</p>
        </div>
        <div class="form-group">
          <label for="firstName">Nombres</label>
          <div class="input-wrapper">
            <input class="input-wrapper__field" type="text" id="firstName" name="firstName"
                   value="${values.firstName}" maxlength="100" autocomplete="given-name"
                   aria-invalid="${not empty errors.firstName}" aria-describedby="firstName-error" required>
          </div>
          <p class="field-error" id="firstName-error">${errors.firstName}</p>
        </div>
        <div class="form-group">
          <label for="lastName">Apellidos</label>
          <div class="input-wrapper">
            <input class="input-wrapper__field" type="text" id="lastName" name="lastName"
                   value="${values.lastName}" maxlength="100" autocomplete="family-name"
                   aria-invalid="${not empty errors.lastName}" aria-describedby="lastName-error" required>
          </div>
          <p class="field-error" id="lastName-error">${errors.lastName}</p>
        </div>
        <div class="form-group">
          <label for="email">Correo electrónico</label>
          <div class="input-wrapper">
            <input class="input-wrapper__field" type="text" id="email" name="email"
                   value="${values.email}" maxlength="254" inputmode="email" autocomplete="email" data-email
                   aria-invalid="${not empty errors.email}" aria-describedby="email-error" required>
          </div>
          <p class="field-error" id="email-error">${errors.email}</p>
        </div>
        <div class="form-group">
          <label for="phoneNumber">Teléfono de contacto</label>
          <div class="input-wrapper">
            <input class="input-wrapper__field" type="text" id="phoneNumber" name="phoneNumber"
                   value="${values.phoneNumber}" minlength="7" maxlength="30" inputmode="tel" autocomplete="tel"
                   aria-invalid="${not empty errors.phoneNumber}" aria-describedby="phoneNumber-error" required>
          </div>
          <p class="field-error" id="phoneNumber-error">${errors.phoneNumber}</p>
        </div>
        <div class="form-group">
          <label for="displayName">Nombre para mostrar</label>
          <div class="input-wrapper">
            <input class="input-wrapper__field" type="text" id="displayName" name="displayName"
                   value="${values.displayName}" maxlength="80" autocomplete="nickname"
                   aria-invalid="${not empty errors.displayName}" aria-describedby="displayName-error" required>
          </div>
          <p class="field-error" id="displayName-error">${errors.displayName}</p>
        </div>
        <button type="submit" class="btn-primary">Registrarse</button>
      </form>
    </section>
  </main>
  <script src="${base}/js/login.js" defer></script>
</body>
</html>
