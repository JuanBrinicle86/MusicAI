/**
 * ASSISTANT PANEL — Componente transversal reutilizable
 * ---------------------------------------------------------
 * Este script se incluye en cualquier pantalla que tenga un
 * botón "IA MusicAI" en el bottom navigation. Su trabajo es:
 *
 *   1. Detectar clics en cualquier elemento marcado con el
 *      atributo [data-assistant-trigger].
 *   2. La PRIMERA vez que eso pasa, descargar el partial
 *      html/assistant-panel.html con fetch() e insertarlo en
 *      el <body> de la página actual.
 *   3. Abrir/cerrar el panel (clic en el botón cerrar, clic
 *      en el overlay, o tecla Escape).
 *
 * No contiene lógica de conversación real: los mensajes que
 * se ven en el panel son contenido estático del propio
 * partial, no algo que este archivo genere o modifique.
 */

(function () {
  "use strict";

  // Ruta relativa al partial. Funciona porque todas las
  // páginas que usan este componente viven en 02_Source/pages/,
  // un nivel por debajo de 02_Source/html/.
  var PARTIAL_URL = "../html/assistant-panel.html";

  // Referencias que se llenan la primera vez que se inyecta
  // el partial. Antes de eso son null.
  var panelEl = null;
  var overlayEl = null;

  // Guarda la Promise de carga en curso para que dos clics
  // rápidos (antes de que termine el primer fetch) reutilicen
  // la misma descarga en vez de inyectar el partial dos veces.
  var loadPromise = null;

  // Guarda qué botón abrió el panel, para devolverle el foco
  // cuando se cierre (mejora básica de accesibilidad).
  var lastTrigger = null;

  /**
   * Descarga el partial y lo inserta en el <body>.
   * Devuelve una Promise para poder abrir el panel justo
   * después de que quede insertado en el DOM.
   */
  function loadPanel() {
    if (loadPromise) {
      return loadPromise;
    }

    loadPromise = fetch(PARTIAL_URL)
      .then(function (response) {
        if (!response.ok) {
          throw new Error(
            "assistant-panel.js: no se pudo cargar " + PARTIAL_URL,
          );
        }
        return response.text();
      })
      .then(function (html) {
        // Se usa un contenedor temporal solo para poder mover
        // sus hijos (overlay + panel) al final del <body>.
        var temp = document.createElement("div");
        temp.innerHTML = html;

        while (temp.firstChild) {
          document.body.appendChild(temp.firstChild);
        }

        panelEl = document.getElementById("assistant-panel");
        overlayEl = document.querySelector("[data-assistant-overlay]");

        // El overlay cierra el panel al tocarlo (fuera del panel).
        overlayEl.addEventListener("click", closePanel);

        // El botón "✕" del propio panel también lo cierra.
        var closeButton = panelEl.querySelector("[data-assistant-close]");
        closeButton.addEventListener("click", closePanel);
      })
      .catch(function (error) {
        // Deja el componente en un estado limpio para que un
        // clic posterior pueda reintentar la descarga.
        console.error(error);
        panelEl = null;
        overlayEl = null;
        loadPromise = null;
        throw error;
      });

    return loadPromise;
  }

  /**
   * Muestra el panel. Si todavía no se ha descargado el
   * partial, lo descarga primero (carga perezosa: solo se
   * pide el archivo la primera vez que el usuario lo necesita).
   */
  function openPanel(trigger) {
    lastTrigger = trigger || null;

    if (panelEl) {
      showPanel();
      return;
    }

    loadPanel()
      .then(showPanel)
      .catch(function () {
        // El error ya quedó registrado en loadPanel(); no hay
        // panel que mostrar, así que no se hace nada más aquí.
      });
  }

  function showPanel() {
    overlayEl.classList.add("is-open");
    panelEl.classList.add("is-open");
    panelEl.setAttribute("aria-hidden", "false");

    // Foco básico: mover la atención al panel al abrirlo.
    panelEl.focus();

    document.addEventListener("keydown", handleEscape);
  }

  function closePanel() {
    if (!panelEl) {
      return;
    }

    overlayEl.classList.remove("is-open");
    panelEl.classList.remove("is-open");
    panelEl.setAttribute("aria-hidden", "true");

    document.removeEventListener("keydown", handleEscape);

    // Devuelve el foco al botón que abrió el panel, para que
    // la persona no "pierda el lugar" en la página.
    if (lastTrigger) {
      lastTrigger.focus();
    }
  }

  function handleEscape(event) {
    if (event.key === "Escape") {
      closePanel();
    }
  }

  // Delegación de eventos en el documento: así funciona sin
  // importar si el trigger ya existía al cargar la página o
  // se agregó después, y sin tener que buscar el botón por id.
  document.addEventListener("click", function (event) {
    var trigger = event.target.closest("[data-assistant-trigger]");
    if (trigger) {
      openPanel(trigger);
    }
  });
})();
