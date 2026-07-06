/* =========================================================
   HOME — Comportamiento exclusivo de esta pantalla
   ---------------------------------------------------------
   Este archivo solo controla el panel local de notificaciones.
   No renderiza datos, no persiste estado y no afecta a otras
   pantallas del prototipo.
   ========================================================= */

(function () {
  "use strict";

  const notificationsButton = document.querySelector("[data-notifications-toggle]");
  const notificationsPanel = document.querySelector("[data-notifications-panel]");

  if (!notificationsButton || !notificationsPanel) {
    return;
  }

  function setPanelOpen(isOpen) {
    /* El atributo hidden quita el panel del árbol visual cuando
       está cerrado, y aria-expanded comunica el estado del botón. */
    notificationsPanel.hidden = !isOpen;
    notificationsButton.setAttribute("aria-expanded", String(isOpen));
    notificationsButton.setAttribute(
      "aria-label",
      isOpen ? "Cerrar notificaciones" : "Abrir notificaciones"
    );
  }

  function isPanelOpen() {
    return notificationsButton.getAttribute("aria-expanded") === "true";
  }

  notificationsButton.addEventListener("click", function () {
    setPanelOpen(!isPanelOpen());
  });

  document.addEventListener("click", function (event) {
    const clickTarget = event.target;

    /* Si el clic ocurre dentro del botón o del panel, se conserva
       el estado actual; cualquier otro clic cierra el panel. */
    if (
      notificationsButton.contains(clickTarget) ||
      notificationsPanel.contains(clickTarget)
    ) {
      return;
    }

    setPanelOpen(false);
  });

  document.addEventListener("keydown", function (event) {
    if (event.key !== "Escape" || !isPanelOpen()) {
      return;
    }

    setPanelOpen(false);
    notificationsButton.focus();
  });
})();
