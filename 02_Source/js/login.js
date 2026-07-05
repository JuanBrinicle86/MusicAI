/**
 * LOGIN — Comportamiento exclusivo de esta pantalla.
 *
 * No existe backend ni autenticación real.
 * La validación se realiza completamente en el cliente
 * contra un único usuario de prueba (evidencia académica).
 */

// IIFE ("function () { ... })()"): envuelve todo el archivo en su propio
// alcance para que TEST_USER y las funciones de abajo no queden como
// variables globales que puedan chocar con otros scripts de la app.
(function () {
  "use strict";

  // Usuario de prueba autorizado para esta evidencia.
  var TEST_USER = {
    email: "test@musicai.com",
    password: "MusicAI123",
  };

  // Referencias a los elementos del DOM que este script necesita manipular.
  // Se buscan una sola vez al cargar el script (login.html usa <script defer>,
  // así que el DOM ya está listo cuando esto corre).
  var form = document.getElementById("login-form");
  var emailInput = document.getElementById("email");
  var passwordInput = document.getElementById("password");
  var toggleButton = document.getElementById("toggle-password");
  var errorBox = document.getElementById("form-error");

  // Muestra el mensaje de error (login.css oculta el elemento vía [hidden]).
  function showError(message) {
    errorBox.textContent = message;
    errorBox.hidden = false;
  }

  // Oculta y limpia el mensaje de error; se llama cada vez que el usuario
  // vuelve a escribir, para no dejar un error viejo visible con datos nuevos.
  function clearError() {
    errorBox.hidden = true;
    errorBox.textContent = "";
  }

  // Alterna la contraseña entre oculta ("password") y visible ("text"),
  // y mantiene sincronizados el texto del botón y sus atributos ARIA
  // (aria-label/aria-pressed) para que lectores de pantalla anuncien el
  // estado actual correctamente.
  function togglePasswordVisibility() {
    var isHidden = passwordInput.type === "password";

    passwordInput.type = isHidden ? "text" : "password";
    toggleButton.textContent = isHidden ? "Ocultar" : "Mostrar";
    toggleButton.setAttribute(
      "aria-label",
      isHidden ? "Ocultar contraseña" : "Mostrar contraseña",
    );
    toggleButton.setAttribute("aria-pressed", isHidden ? "true" : "false");
  }

  // Maneja el envío del formulario. No hay backend: la "autenticación" es
  // una comparación local contra TEST_USER, suficiente para esta evidencia
  // académica. Si coincide, navega a la pantalla principal; si no, muestra error.
  function handleSubmit(event) {
    // Evita el envío/recarga real del formulario (no hay servidor que lo reciba).
    event.preventDefault();

    var email = emailInput.value.trim();
    var password = passwordInput.value;

    var credentialsAreValid =
      email === TEST_USER.email && password === TEST_USER.password;

    if (credentialsAreValid) {
      window.location.href = "/pages/home.html";
      return;
    }

    showError(
      "Correo o contraseña incorrectos. Verifica tus datos e intenta de nuevo.",
    );
  }

  // Conecta el comportamiento con los elementos de la interfaz.
  toggleButton.addEventListener("click", togglePasswordVisibility);
  form.addEventListener("submit", handleSubmit);
  emailInput.addEventListener("input", clearError);
  passwordInput.addEventListener("input", clearError);
})();
