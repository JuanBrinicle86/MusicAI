/* =========================================================
   HOME — Comportamiento exclusivo de esta pantalla
   ---------------------------------------------------------
   Este archivo controla el panel local de notificaciones, el
   cálculo del progreso académico demostrativo, el montaje del
   Bottom Navigation transversal y la simulación temporal de
   Afinador. No persiste estado y no afecta a otras pantallas.
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

/* ---------------------------------------------------------
   PROGRESO ACADÉMICO DEL NIVEL INTERMEDIO
   Dataset demostrativo autorizado: ejercicios completados por
   lección. El progreso es ejercicios completados / totales,
   nunca XP.
   --------------------------------------------------------- */
(function () {
  "use strict";

  const intermediateLessons = [
    { title: "Cadencias funcionales", completed: 4, total: 4 },
    { title: "Acordes con séptima", completed: 1, total: 4 },
    { title: "Progresiones armónicas", completed: 0, total: 4 },
  ];

  const completed = intermediateLessons.reduce(function (sum, lesson) {
    return sum + lesson.completed;
  }, 0);
  const total = intermediateLessons.reduce(function (sum, lesson) {
    return sum + lesson.total;
  }, 0);
  const percent = Math.round((completed / total) * 100); // 5 / 12 → 42

  document.querySelectorAll("[data-academic-completed]").forEach(function (el) {
    el.textContent = String(completed);
  });
  document.querySelectorAll("[data-academic-total]").forEach(function (el) {
    el.textContent = String(total);
  });
  document.querySelectorAll("[data-academic-percent]").forEach(function (el) {
    el.textContent = percent + "%";
  });
  document.querySelectorAll("[data-academic-fill]").forEach(function (el) {
    el.style.width = percent + "%";
  });
})();

/* ---------------------------------------------------------
   BOTTOM NAVIGATION + SIMULACIÓN DE AFINADOR
   Home es el destino activo. Afinador todavía no navega a
   tuner.html: muestra una simulación temporal que oculta el
   contenido de Home sin destruirlo (el árbol conserva su
   estado de apertura y se restaura el scroll al volver).
   --------------------------------------------------------- */
(function () {
  "use strict";

  const navHost = document.querySelector("[data-bottom-nav]");
  const homeContent = document.querySelector("[data-home-content]");
  const tunerSimulation = document.querySelector("[data-tuner-simulation]");
  const tunerClose = document.querySelector("[data-tuner-close]");

  if (!navHost || !window.MusicAIBottomNav) {
    return;
  }

  let nav = null;
  let tunerTrigger = null;
  let savedScroll = 0;

  function isTunerOpen() {
    return Boolean(tunerSimulation) && !tunerSimulation.hidden;
  }

  function openTuner(trigger) {
    if (!homeContent || !tunerSimulation || isTunerOpen()) {
      return;
    }

    tunerTrigger = trigger;
    savedScroll = window.scrollY;
    homeContent.hidden = true;
    tunerSimulation.hidden = false;
    nav.setActive("tuner");
    window.scrollTo(0, 0);
    tunerSimulation.focus();
  }

  function closeTuner(restoreFocus) {
    if (!isTunerOpen()) {
      return;
    }

    tunerSimulation.hidden = true;
    homeContent.hidden = false;
    nav.setActive("home");
    window.scrollTo(0, savedScroll);

    if (restoreFocus && tunerTrigger) {
      tunerTrigger.focus();
    }
  }

  nav = window.MusicAIBottomNav.mount(navHost, {
    active: "home",
    // Home ya está montado en esta página: se resuelve localmente
    // (cierra Afinador si está abierto) sin recargar ni perder el
    // estado del árbol.
    onHome: function (event) {
      event.preventDefault();
      closeTuner(false);
    },
    onTuner: openTuner,
  });

  if (tunerClose) {
    tunerClose.addEventListener("click", function () {
      closeTuner(true);
    });
  }

  document.addEventListener("keydown", function (event) {
    if (event.key === "Escape" && isTunerOpen()) {
      closeTuner(true);
    }
  });
})();
