(function () {
  "use strict";

  var presets = [
    {
      name: "E Standard",
      notes: ["E", "A", "D", "G", "B", "E"],
      fixtures: [
        { state: "grave", frequency: 79.4, markerPercent: 22 },
        { state: "en tono", frequency: 110.0, markerPercent: 50 },
        { state: "agudo", frequency: 154.2, markerPercent: 76 },
        { state: "en tono", frequency: 196.0, markerPercent: 50 },
        { state: "grave", frequency: 236.0, markerPercent: 28 },
        { state: "agudo", frequency: 336.7, markerPercent: 72 },
      ],
    },
    {
      name: "Eb Standard",
      notes: ["Eb", "Ab", "Db", "Gb", "Bb", "Eb"],
      fixtures: [
        { state: "agudo", frequency: 83.1, markerPercent: 74 },
        { state: "grave", frequency: 99.5, markerPercent: 25 },
        { state: "en tono", frequency: 138.59, markerPercent: 50 },
        { state: "grave", frequency: 176.0, markerPercent: 28 },
        { state: "agudo", frequency: 245.0, markerPercent: 72 },
        { state: "en tono", frequency: 311.13, markerPercent: 50 },
      ],
    },
    {
      name: "D Standard",
      notes: ["D", "G", "C", "F", "A", "D"],
      fixtures: [
        { state: "grave", frequency: 70.9, markerPercent: 25 },
        { state: "agudo", frequency: 103.1, markerPercent: 72 },
        { state: "en tono", frequency: 130.81, markerPercent: 50 },
        { state: "grave", frequency: 168.4, markerPercent: 28 },
        { state: "agudo", frequency: 224.2, markerPercent: 74 },
        { state: "en tono", frequency: 293.66, markerPercent: 50 },
      ],
    },
    {
      name: "Drop D",
      notes: ["D", "A", "D", "G", "B", "E"],
      fixtures: [
        { state: "en tono", frequency: 73.42, markerPercent: 50 },
        { state: "grave", frequency: 105.2, markerPercent: 24 },
        { state: "agudo", frequency: 152.8, markerPercent: 74 },
        { state: "en tono", frequency: 196.0, markerPercent: 50 },
        { state: "grave", frequency: 238.8, markerPercent: 30 },
        { state: "agudo", frequency: 338.4, markerPercent: 72 },
      ],
    },
    {
      name: "C Standard",
      notes: ["C", "F", "Bb", "Eb", "G", "C"],
      fixtures: [
        { state: "agudo", frequency: 67.8, markerPercent: 72 },
        { state: "grave", frequency: 82.8, markerPercent: 24 },
        { state: "en tono", frequency: 116.54, markerPercent: 50 },
        { state: "agudo", frequency: 160.9, markerPercent: 72 },
        { state: "grave", frequency: 188.0, markerPercent: 26 },
        { state: "en tono", frequency: 261.63, markerPercent: 50 },
      ],
    },
    {
      name: "Drop C",
      notes: ["C", "G", "C", "F", "A", "D"],
      fixtures: [
        { state: "grave", frequency: 62.8, markerPercent: 22 },
        { state: "en tono", frequency: 98.0, markerPercent: 50 },
        { state: "agudo", frequency: 136.2, markerPercent: 76 },
        { state: "grave", frequency: 168.4, markerPercent: 28 },
        { state: "agudo", frequency: 226.0, markerPercent: 72 },
        { state: "en tono", frequency: 293.66, markerPercent: 50 },
      ],
    },
  ];

  var state = {
    activePreset: "E Standard",
    activeStringIndex: null,
  };

  var presetSelect = document.getElementById("preset-select");
  var readoutNote = document.getElementById("readout-note");
  var readoutFrequency = document.getElementById("readout-frequency");
  var gaugeMarker = document.getElementById("gauge-marker");
  var gaugeState = document.getElementById("gauge-state");
  var closeButton = document.querySelector(".tuner-close");
  var detectionControls = document.querySelectorAll(".string-indicator");
  var physicalStrings = document.querySelectorAll(".physical-string");
  var headstockPegs = document.querySelectorAll(".headstock__peg");
  var stringIndicators = document.querySelectorAll(".string-indicator");
  function getPresetByName(name) {
    return presets.find(function (preset) {
      return preset.name === name;
    });
  }

  function translateState(value) {
    if (value === "grave") {
      return "grave";
    }
    if (value === "agudo") {
      return "agudo";
    }
    return "en tono";
  }

  function getCurrentFixture() {
    if (state.activeStringIndex === null) {
      return null;
    }

    var preset = getPresetByName(state.activePreset);
    return preset.fixtures[state.activeStringIndex];
  }

  function setActiveString(index) {
    state.activeStringIndex = index;
    renderAll();
  }

  function updateGauge(markerPercent) {
    if (markerPercent === undefined) {
      gaugeMarker.style.left = "50%";
      return;
    }

    gaugeMarker.style.left = markerPercent + "%";
  }

  function updateGaugeStateLabel() {
    if (state.activeStringIndex === null) {
      gaugeState.setAttribute("aria-label", "Indicador de afinación");
      return;
    }

    var preset = getPresetByName(state.activePreset);
    var fixture = preset.fixtures[state.activeStringIndex];
    var targetNote = preset.notes[state.activeStringIndex];
    var stateLabel = translateState(fixture.state);

    var label =
      "Cuerda " +
      targetNote +
      " detectada, " +
      Number(fixture.frequency).toFixed(2) +
      " Hz, " +
      stateLabel;
    gaugeState.setAttribute("aria-label", label);
  }

  function renderReadout() {
    if (state.activeStringIndex === null) {
      readoutNote.textContent = "—";
      readoutFrequency.textContent = "— Hz";
      updateGauge(50);
      updateGaugeStateLabel();
      return;
    }

    var preset = getPresetByName(state.activePreset);
    var fixture = preset.fixtures[state.activeStringIndex];
    var targetNote = preset.notes[state.activeStringIndex];

    readoutNote.textContent = targetNote;
    readoutFrequency.textContent = Number(fixture.frequency).toFixed(2) + " Hz";
    updateGauge(fixture.markerPercent);
    updateGaugeStateLabel();
  }

  function updateStringIndicatorNotes() {
    var preset = getPresetByName(state.activePreset);
    stringIndicators.forEach(function (indicator) {
      var index = Number(indicator.dataset.stringIndex);
      var noteElement = indicator.querySelector(".string-indicator__note");
      if (noteElement) {
        noteElement.textContent = preset.notes[index];
      }
    });
  }

  function renderDetectionControls() {
    var preset = getPresetByName(state.activePreset);

    detectionControls.forEach(function (control) {
      var index = Number(control.dataset.stringIndex);
      var isActive = index === state.activeStringIndex;
      var fixture = preset.fixtures[index];
      var isTuned = isActive && fixture.state === "en tono";

      control.classList.toggle("is-active", isActive);
      control.classList.toggle("is-tuned", isTuned);
      control.setAttribute("aria-pressed", String(isActive));
      control.setAttribute(
        "aria-label",
        "Simular detección de " + (6 - index) + ".ª cuerda, " + preset.notes[index],
      );
    });
    physicalStrings.forEach(function (physicalString) {
      var index = Number(physicalString.dataset.stringIndex);
      var isActive = index === state.activeStringIndex;
      var fixture = preset.fixtures[index];

      physicalString.classList.toggle("is-active", isActive);
      physicalString.classList.toggle(
        "is-tuned",
        isActive && fixture.state === "en tono",
      );
    });
    headstockPegs.forEach(function (peg) {
      var index = Number(peg.dataset.stringIndex);
      peg.classList.toggle("is-active", index === state.activeStringIndex);
    });
  }

  function renderPreset() {
    presetSelect.value = state.activePreset;
  }

  function renderAll() {
    renderPreset();
    updateStringIndicatorNotes();
    renderDetectionControls();
    renderReadout();
  }

  presetSelect.addEventListener("change", function (event) {
    state.activePreset = event.target.value;
    state.activeStringIndex = null;
    renderAll();
  });

  detectionControls.forEach(function (control) {
    var handleDetection = function () {
      var index = Number(control.dataset.stringIndex);
      setActiveString(index);
    };

    control.addEventListener("click", handleDetection);
    control.addEventListener("keydown", function (event) {
      if (event.key === "Enter" || event.key === " ") {
        event.preventDefault();
        handleDetection();
      }
    });
    control.addEventListener("focus", handleDetection);
    control.addEventListener("mouseenter", function () {
      if (window.matchMedia("(hover: hover)").matches) {
        handleDetection();
      }
    });
  });

  physicalStrings.forEach(function (physicalString) {
    var handlePointerDetection = function () {
      setActiveString(Number(physicalString.dataset.stringIndex));
    };

    physicalString.addEventListener("click", handlePointerDetection);
    physicalString.addEventListener("mouseenter", function () {
      if (window.matchMedia("(hover: hover)").matches) {
        handlePointerDetection();
      }
    });
  });

  closeButton.addEventListener("click", function () {
    if (window.history.length > 1) {
      window.history.back();
      window.setTimeout(function () {
        if (window.location.pathname.toLowerCase().endsWith("tuner.html")) {
          window.location.href = "home.html";
        }
      }, 150);
      return;
    }

    window.location.href = "home.html";
  });

  renderAll();
})();
