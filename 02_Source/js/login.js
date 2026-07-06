/**
 * LOGIN — Comportamiento exclusivo de esta pantalla.
 *
 * No existe backend ni autenticación real.
 * La validación se realiza completamente en el cliente
 * contra un único usuario de prueba (evidencia académica).
 */

(function () {
  "use strict";

  // Usuario de prueba autorizado para esta evidencia.
  var TEST_USER = {
    email: "test@musicai.com",
    password: "MusicAI123",
  };

  var form = document.getElementById("login-form");
  var emailInput = document.getElementById("email");
  var passwordInput = document.getElementById("password");
  var toggleButton = document.getElementById("toggle-password");
  var errorBox = document.getElementById("form-error");

  // Muestra el mensaje de error dentro de la misma pantalla (sin alert/toast).
  function showError(message) {
    errorBox.textContent = message;
    errorBox.hidden = false;
  }

  // Oculta el mensaje de error cuando la persona vuelve a escribir.
  function clearError() {
    errorBox.hidden = true;
    errorBox.textContent = "";
  }

  // Alterna entre mostrar y ocultar la contraseña escrita.
  function togglePasswordVisibility() {
    var isHidden = passwordInput.type === "password";

    passwordInput.type = isHidden ? "text" : "password";
    toggleButton.textContent = isHidden ? "Ocultar" : "Mostrar";
    toggleButton.setAttribute("aria-label", isHidden ? "Ocultar contraseña" : "Mostrar contraseña");
    toggleButton.setAttribute("aria-pressed", isHidden ? "true" : "false");
  }

  // Intercepta el envío del formulario: valida localmente y solo redirige si las credenciales coinciden con TEST_USER.
  function handleSubmit(event) {
    event.preventDefault();

    var email = emailInput.value.trim();
    var password = passwordInput.value;

    var credentialsAreValid =
      email === TEST_USER.email && password === TEST_USER.password;

    if (credentialsAreValid) {
      window.location.href = "home.html";
      return;
    }

    showError("Correo o contraseña incorrectos. Verifica tus datos e intenta de nuevo.");
  }

  toggleButton.addEventListener("click", togglePasswordVisibility);
  form.addEventListener("submit", handleSubmit);
  emailInput.addEventListener("input", clearError);
  passwordInput.addEventListener("input", clearError);
})();
