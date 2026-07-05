(function () {
  "use strict";

  /*
   * Esta pantalla tiene dos modos:
   * - URL normal: muestra la ruta colapsada como vista general.
   * - ?continue=1: abre la lección actual para retomar el avance.
   */
  var params = new URLSearchParams(window.location.search);

  if (params.get("continue") !== "1") {
    return;
  }

  var intermediateLevel = document.getElementById("intermediate-level");
  var seventhChordsLesson = document.getElementById("seventh-chords-lesson");
  var currentExercise = document.querySelector(
    '[data-current-exercise="true"]'
  );

  if (intermediateLevel) {
    intermediateLevel.open = true;
  }

  if (seventhChordsLesson) {
    seventhChordsLesson.open = true;
  }

  if (currentExercise) {
    currentExercise.classList.add("exercise-item--active");
  }
})();
