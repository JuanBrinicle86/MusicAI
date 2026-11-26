// Importa React para JSX y useState para recordar la apertura de la lección.
import React, { useState } from "react";
// Importa la función que monta React en un nodo del HTML existente.
import { createRoot } from "react-dom/client";

// Conserva los datos demostrativos de los cuatro ejercicios en su orden original.
const exercises = [
  // Identificador estable, estilo, icono, título, estado accesible y enlace del ejercicio completado.
  { id: "identify", style: "done", icon: "♪", title: "Identificar acordes con séptima", status: "Completado", href: "interactive-exercise.html" },
  // El ejercicio actual conserva el mismo destino y el atributo que lo identifica.
  { id: "build", style: "active", icon: "♫", title: "Construir progresión ii-V-I", status: "Actual", href: "interactive-exercise.html", isCurrent: true },
  // Los ejercicios bloqueados conservan sus iconos y carecen de destino.
  { id: "play", style: "locked", icon: "🎸", title: "Ejecutar cadencia en guitarra", status: "Bloqueado" },
  { id: "evaluate", style: "locked", icon: "✓", title: "Evaluación interactiva", status: "Bloqueado" },
];

// Recibe la lista de ejercicios y el estado inicial mediante props.
function LessonAccordion({ exercises, initiallyOpen }) {
  // Inicia el estado de apertura con el valor recibido al montar el componente.
  const [isOpen, setIsOpen] = useState(initiallyOpen);

  // Copia al estado de React el valor que el navegador aplica al abrir o cerrar.
  function handleToggle(event) {
    setIsOpen(event.currentTarget.open);
  }

  // Renderiza el acordeón con sus clases originales y con el estado sincronizado.
  return (
    <details id="seventh-chords-lesson" className="lesson-group" open={isOpen} onToggle={handleToggle}>
      {/* Conserva el control nativo, que admite ratón y teclado. */}
      <summary className="lesson-item lesson-item--active">
        {/* Muestra el número con su estilo activo y lo oculta a lectores de pantalla. */}
        <span className="lesson-item__number lesson-item__number--active" aria-hidden="true">2</span>
        {/* Presenta el título y la etiqueta de estado de la lección. */}
        <p className="lesson-item__title">Acordes con séptima</p>
        <span className="lesson-item__badge">Activa</span>
        {/* La flecha es decorativa y el CSS la gira al abrir el acordeón. */}
        <span className="lesson-item__chevron" aria-hidden="true">›</span>
      </summary>

      {/* Conserva la lista ordenada de ejercicios dentro de la lección. */}
      <ol className="exercise-list">
        {/* Convierte cada ejercicio de la prop en una fila. */}
        {exercises.map((exercise) => {
          // Combina la clase común con la variante de estado del ejercicio.
          const className = `exercise-item exercise-item--${exercise.style}`;
          // Reutiliza el contenido visual y accesible para enlaces y filas bloqueadas.
          const content = (
            <>
              {/* Muestra el icono decorativo del ejercicio. */}
              <span className="exercise-item__icon" aria-hidden="true">{exercise.icon}</span>
              {/* Muestra el título y anuncia el estado mediante texto visualmente oculto. */}
              <p className="exercise-item__title">{exercise.title}</p>
              <span className="visually-hidden">{exercise.status}</span>
              {/* Indica visualmente si la fila tiene destino o está bloqueada. */}
              <span className="exercise-item__chevron" aria-hidden="true">{exercise.href ? "›" : "🔒"}</span>
            </>
          );

          // Usa el identificador del ejercicio como clave estable de la fila.
          return (
            <li key={exercise.id}>
              {/* Renderiza un enlace si existe destino y conserva los atributos del ejercicio actual. */}
              {exercise.href ? (
                <a
                  className={className}
                  href={exercise.href}
                  data-current-exercise={exercise.isCurrent ? "true" : undefined}
                  aria-current={exercise.isCurrent ? "step" : undefined}
                >
                  {content}
                </a>
              ) : (
                // Renderiza una fila sin navegación para el ejercicio bloqueado.
                <div className={className} data-locked-exercise="">{content}</div>
              )}
            </li>
          );
        })}
      </ol>
    </details>
  );
}

// Busca la fila que sirve de punto de montaje dentro de Home/Ruta.
const mount = document.querySelector("[data-lesson-accordion]");
// Monta una sola instancia y solicita que la lección empiece abierta.
createRoot(mount).render(<LessonAccordion exercises={exercises} initiallyOpen />);
