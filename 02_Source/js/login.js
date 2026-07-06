/**
 * LOGIN — Comportamiento exclusivo de esta pantalla.
 *
 * No existe backend ni autenticación real.
 * Para esta evidencia académica, el formulario solo previene
 * el envío HTML normal y navega al Home del prototipo.
 */

// IIFE ("function () { ... })()"): envuelve todo el archivo en su propio
// alcance para que las variables y funciones de abajo no queden como
// globales que puedan chocar con otros scripts de la app.
(function () {
  "use strict";

  // Referencias a los elementos del DOM que este script necesita manipular.
  // Se buscan una sola vez al cargar el script (login.html usa <script defer>,
  // así que el DOM ya está listo cuando esto corre).
  var form = document.getElementById("login-form");
  var emailInput = document.getElementById("email");
  var passwordInput = document.getElementById("password");
  var toggleButton = document.getElementById("toggle-password");
  var errorBox = document.getElementById("form-error");

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

  // Maneja el envío del formulario. No hay backend: para esta evidencia
  // académica el botón solo debe navegar al Home del prototipo.
  function handleSubmit(event) {
    // Evita el envío/recarga real del formulario (no hay servidor que lo reciba).
    event.preventDefault();

    window.location.href = "home.html";
  }

  // Conecta el comportamiento con los elementos de la interfaz.
  toggleButton.addEventListener("click", togglePasswordVisibility);
  form.addEventListener("submit", handleSubmit);
  emailInput.addEventListener("input", clearError);
  passwordInput.addEventListener("input", clearError);
})();
