"use strict";

const password = document.getElementById("password");
const toggle = document.getElementById("toggle-password");

if (password && toggle) {
  toggle.addEventListener("click", () => {
    const show = password.type === "password";
    password.type = show ? "text" : "password";
    toggle.textContent = show ? "Ocultar" : "Mostrar";
    toggle.setAttribute("aria-pressed", String(show));
  });
}

const atom = "[A-Za-z0-9!#$%&'*+/=?^`{|}~_-]+";
const label = "[A-Za-z0-9](?:[A-Za-z0-9-]{0,61}[A-Za-z0-9])?";
const emailFormat = new RegExp(
  atom + "(?:\\." + atom + ")*@(?:" + label + "\\.)+[A-Za-z]{2,63}(?![\\s\\S])"
);
const email = document.querySelector("[data-email]");

if (email) {
  const validateEmail = () => {
    const value = email.value.replace(/^\p{Zs}+|\p{Zs}+$/gu, "");
    const match = emailFormat.exec(value);
    const valid = value.length <= 254 && value.indexOf("@") <= 64 && match?.index === 0;
    email.setCustomValidity(
      value && !valid ? "Ingresa un correo electrónico válido." :
      !value ? "Este campo es obligatorio." : ""
    );
  };
  email.addEventListener("input", validateEmail);
  email.form.addEventListener("submit", (event) => {
    validateEmail();
    if (!email.reportValidity()) {
      event.preventDefault();
    }
  });
}
