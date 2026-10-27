/**
 * BOTTOM NAVIGATION — Componente transversal reutilizable
 * ---------------------------------------------------------
 * Genera el mismo markup del Bottom Navigation existente del
 * prototipo (nav.bottom-nav > ul.bottom-nav__list > li...).
 * Estilos en css/bottom-nav.css.
 *
 * Uso:
 *   var nav = MusicAIBottomNav.mount(hostNav, {
 *     active: "home",                     // id del destino actual
 *     onHome: function (event) { ... },   // opcional
 *     onTuner: function (button) { ... }
 *   });
 *   nav.setActive("tuner");
 *
 * - El destino activo se marca con bottom-nav__item--active y
 *   aria-current="page"; setActive() lo cambia sin re-montar.
 * - "Home" siempre es un enlace real a home.html. Un consumidor
 *   que ya muestra Home puede llamar event.preventDefault() en
 *   options.onHome para resolverlo localmente sin recargar.
 * - "IA MusicAI" conserva el atributo [data-assistant-trigger]
 *   que escucha assistant-panel.js.
 * - "Afinador" todavía no navega a una pantalla canónica: es un
 *   <button> cuyo comportamiento resuelve la pantalla consumidora
 *   mediante options.onTuner.
 */

(function (global) {
  "use strict";

  // Destinos canónicos, en orden. Los iconos son las mismas
  // entidades Unicode del Bottom Navigation existente.
  var ITEMS = [
    { id: "home", label: "Home", icon: "⌂", href: "home.html" },
    { id: "tuner", label: "Afinador", icon: "🎸", action: "tuner" },
    { id: "assistant", label: "IA MusicAI", icon: "🤖", action: "assistant" },
    {
      id: "challenges",
      label: "Desafíos",
      icon: "🏆",
      href: "challenges-achievements.html",
    },
    { id: "community", label: "Comunidad", icon: "👥", href: "community.html" },
  ];

  function createIcon(item) {
    var icon = document.createElement("span");
    icon.className = "bottom-nav__icon";
    if (item.action === "assistant") {
      icon.className += " bottom-nav__icon--assistant";
    }
    icon.setAttribute("aria-hidden", "true");
    icon.textContent = item.icon;
    return icon;
  }

  function createLabel(item) {
    var label = document.createElement("span");
    label.className = "bottom-nav__label";
    label.textContent = item.label;
    return label;
  }

  function createItem(item, options) {
    var li = document.createElement("li");
    li.className = "bottom-nav__item";
    li.dataset.bottomNavItem = item.id;

    if (item.action === "assistant") {
      li.className += " bottom-nav__item--assistant";
    }

    var control;

    if (item.href) {
      control = document.createElement("a");
      control.href = item.href;
    } else {
      control = document.createElement("button");
      control.type = "button";
    }

    control.className = "bottom-nav__link";

    if (item.action === "assistant") {
      // Contrato existente de assistant-panel.js (delegación en document).
      control.setAttribute("data-assistant-trigger", "");
    }

    if (item.action === "tuner") {
      control.addEventListener("click", function () {
        if (typeof options.onTuner === "function") {
          options.onTuner(control);
        }
      });
    }

    if (item.id === "home") {
      // Sin onHome (o sin preventDefault) el enlace navega a home.html.
      control.addEventListener("click", function (event) {
        if (typeof options.onHome === "function") {
          options.onHome(event);
        }
      });
    }

    control.append(createIcon(item), createLabel(item));
    li.appendChild(control);
    return li;
  }

  function setActive(list, id) {
    Array.prototype.forEach.call(list.children, function (li) {
      var isActive = li.dataset.bottomNavItem === id;
      var control = li.firstElementChild;

      li.classList.toggle("bottom-nav__item--active", isActive);
      if (isActive) {
        control.setAttribute("aria-current", "page");
      } else {
        control.removeAttribute("aria-current");
      }
    });
  }

  function mount(host, options) {
    if (!host) {
      return null;
    }

    options = options || {};

    var list = document.createElement("ul");
    list.className = "bottom-nav__list";

    ITEMS.forEach(function (item) {
      list.appendChild(createItem(item, options));
    });

    host.classList.add("bottom-nav");
    if (!host.hasAttribute("aria-label")) {
      host.setAttribute("aria-label", "Navegación principal");
    }
    host.replaceChildren(list);
    setActive(list, options.active);

    return {
      element: host,
      setActive: function (id) {
        setActive(list, id);
      },
    };
  }

  global.MusicAIBottomNav = { mount: mount };
})(window);
