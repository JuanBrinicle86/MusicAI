# MusicAI — Task Contract

## Integración incremental Home/Ruta del prototipo HTML/CSS/JavaScript

**Estado:** ACTIVO — APROBADO POR JUAN CARLOS PARA EL LOTE
**Ruta operativa:** `00_Documentation/task-contract/current.md`
**Proyecto:** MusicAI
**Rama prevista:** `main`
**Commit base esperado:** `28f5fd9723f155f207e8a465749168bcf38b6e33`
**Responsable funcional:** Atlas
**Arquitectura:** decisiones consolidadas de Daedalus + Atlas + Juan Carlos
**Implementador:** ForgeB
**Validador independiente posterior:** Sentinel
**Autoridad final:** Juan Carlos Carvajal

**Evidencias relacionadas:**

- **GA6-220501096-AA3-EV03** — Interfaces gráficas según requerimientos del proyecto.
- **GA6-220501096-AA4-EV01** — Fundamentos en la implementación de componentes frontend, HTML, CSS, JS.

---

# 1. Objetivo del lote

Alinear el prototipo web existente de MusicAI con las Historias de Usuario vigentes mediante una **integración incremental y conservadora de Home y Ruta en una única pantalla**, reutilizando la implementación HTML, CSS y JavaScript ya existente.

El lote debe:

1. conservar la identidad visual actual de MusicAI;
2. conservar el árbol de aprendizaje existente de `learning-path.html`;
3. integrar ese árbol dentro de `home.html`;
4. convertir `home.html` en la única experiencia funcional canónica de Home/Ruta;
5. ajustar únicamente los elementos que contradicen las HU o la Baseline vigente;
6. extraer el Bottom Navigation visual existente como componente transversal reutilizable;
7. incorporar `Afinador` al Bottom Navigation;
8. conservar la navegación existente hacia IA MusicAI, Desafíos y Comunidad;
9. implementar únicamente para Afinador una experiencia temporal de simulación/no implementado;
10. evitar cualquier rediseño, reescritura general o tercera interpretación visual de Home/Ruta.

Este lote es una **adaptación del prototipo existente**, no una reconstrucción del frontend.

---

# 2. Principio rector — Preservar, integrar y ajustar

La regla principal de este lote es:

> **El código y diseño existentes son la base. Se modifica únicamente aquello que contradiga las HU/Baseline o aquello estrictamente necesario para integrar Home y Ruta. Todo elemento visual, estructural o interactivo compatible debe conservarse.**

ForgeB NO está autorizado a:

- reinterpretar la pantalla;
- modernizarla por criterio propio;
- simplificar su diseño;
- rediseñarla;
- reemplazarla por una composición nueva;
- copiar el diseño Flutter;
- reconstruir Home desde cero;
- reconstruir el árbol de Ruta desde cero;
- sustituir fuentes tipográficas;
- cambiar paleta por preferencia;
- cambiar radios, proporciones, iconografía o espaciados sin necesidad funcional;
- crear una tercera versión visual de Home/Ruta;
- reemplazar archivos completos cuando un cambio localizado sea suficiente.

La implementación debe ser un **delta mínimo y trazable** sobre el prototipo actual.

---

# 3. Referencia visual obligatoria

Las referencias visuales principales para este lote son las implementaciones reales existentes en:

- `02_Source/pages/home.html`
- `02_Source/css/home.css`
- `02_Source/pages/learning-path.html`
- `02_Source/css/learning-path.css`

### 3.1 Home existente

Conservar como base visual:

- contenedor móvil;
- fondo;
- paleta;
- Header;
- avatar;
- marca MusicAI;
- campana de notificaciones;
- tarjetas;
- jerarquía tipográfica;
- estilo de progreso que continúe siendo aplicable;
- espaciado general;
- identidad oscura/púrpura.

### 3.2 Árbol existente de Ruta

El árbol actual de `learning-path.html` es la **referencia visual obligatoria** del árbol integrado.

Preservar especialmente:

- línea vertical de recorrido;
- nodos/indicadores laterales;
- círculos numerados de niveles;
- tarjetas de niveles;
- estados completado, actual y bloqueado;
- jerarquía Nivel → Lección → Ejercicio;
- indentación;
- estructura de Intermedio;
- estilo de lecciones;
- estilo de ejercicios;
- badge de lección activa;
- iconografía existente;
- tratamiento visual de niveles bloqueados;
- patrón de expansión existente;
- proporciones;
- tipografía;
- paleta;
- bordes;
- radios;
- sombras/glows existentes;
- densidad visual.

Selectores/estructuras históricas relevantes incluyen, entre otros:

- `.level-card--done`;
- `#intermediate-level`;
- `#seventh-chords-lesson`;
- tarjetas de Avanzado/Experto bloqueadas;
- filas de lecciones;
- filas de ejercicios.

ForgeB podrá adaptar selectores al integrarlos en Home únicamente cuando sea técnicamente necesario, pero deberá conservar su apariencia.

### 3.3 Flutter NO es referencia visual para este lote

`03_App/**` puede consultarse únicamente para comprobar decisiones funcionales ya consolidadas, por ejemplo:

- Home/Ruta unificada;
- dataset;
- 5/12;
- 42 %;
- estados.

NO copiar:

- layout Flutter;
- widgets Flutter;
- tamaños Flutter;
- estilos Flutter;
- distribución Flutter;
- botones Flutter;
- apariencia de las tarjetas Flutter.

La interfaz web debe continuar pareciendo el **prototipo web de MusicAI**.

---

# 4. Restricción tecnológica

Toda implementación productiva de este lote utilizará exclusivamente:

- HTML5;
- CSS3;
- JavaScript nativo / Vanilla JavaScript.

No introducir:

- React;
- Vue;
- Angular;
- Svelte;
- TypeScript;
- jQuery;
- Bootstrap;
- Tailwind;
- frameworks;
- bibliotecas externas;
- npm;
- bundlers;
- transpiladores;
- sistema de compilación;
- backend;
- API;
- JWT;
- base de datos;
- persistencia;
- `localStorage`;
- `sessionStorage`;
- IndexedDB.

Node.js podrá utilizarse únicamente si ya existe en el entorno para validaciones como `node --check`.

No forma parte del runtime ni de la evidencia.

---

# 5. Fuentes y jerarquía de autoridad

Aplicar este orden:

1. repositorio real y estado exacto del código;
2. `00_Documentation/requirements/user-stories-v2.xlsx`;
3. `00_Documentation/requirements/MusicAI_Functional_Baseline_V3.2.md`;
4. arquitectura vigente;
5. este Task Contract;
6. decisiones explícitas de Juan Carlos;
7. prototipo histórico como referencia visual/implementativa.

Cuando un comportamiento histórico contradiga una HU o la Baseline, se modifica el comportamiento.

Cuando un elemento histórico no contradiga ninguna fuente vigente, se conserva.

No modificar algo únicamente por preferencia técnica o estética.

---

# 6. Historias de Usuario cubiertas

Este lote cubre principalmente:

- **R04** — Continuar el proceso de aprendizaje.
- **R05** — Consultar y explorar la ruta de aprendizaje.
- **R06** — Consultar el resumen del progreso académico.
- **R07** — Navegar hacia los módulos principales.
- **R08** — Acceder a Notificaciones, preservando el comportamiento existente compatible.

### 6.1 Cobertura diferida

R09 y R12, relacionadas con consultas contextuales de IA desde Nivel, Lección y Ejercicio, **no se implementarán ni rediseñarán en este lote**.

Motivo:

- el componente `assistant-panel.*` es transversal y actualmente compartido por múltiples pantallas;
- Juan Carlos ha decidido conservar su comportamiento existente en este lote;
- modificar la arquitectura contextual del asistente ampliaría innecesariamente el alcance.

La ausencia de esa alineación completa deberá registrarse como cobertura futura, no resolverse mediante una simulación nueva ni mediante botones Info improvisados.

### Cobertura progresiva de las Historias de Usuario

Las Historias de Usuario asociadas a Home/Ruta se utilizan en este lote como marco de coherencia funcional y arquitectónica.

Este Task Contract NO declara implementación completa de todos los criterios de aceptación de R04–R08.

La implementación del prototipo se realizará progresivamente conforme a las evidencias solicitadas durante la fase de ejecución, evitando introducir decisiones que contradigan las HU o dificulten su implementación posterior.

Para este lote:

#### R05 — cobertura parcial autorizada

Se implementa:

- Home y Ruta como una única experiencia.
- Jerarquía visible Nivel → Lección → Ejercicio.
- Representación de estados completado, actual/activo y bloqueado.
- Nivel actual Intermedio.
- Lección activa Acordes con séptima.
- Ejercicio actual Construir progresión ii-V-I.
- Bloqueo efectivo de ejercicios no habilitados.
- Integración del árbol existente de Ruta dentro de Home.
- Exploración correspondiente al nivel/lección actual necesaria para la evidencia.

Queda expresamente DIFERIDO para lotes posteriores de alineación funcional:

- expansión/contracción completa de todos los niveles completados o disponibles;
- expansión/contracción completa de todas las lecciones completadas o disponibles;
- presentación visible del porcentaje académico individual de cada lección;
- actualización dinámica completa de disponibilidad y desbloqueos;
- contenido interno no definido de Básico y Elemental;
- cualquier criterio de R05 que dependa de persistencia o progreso real.

La ausencia de estos elementos en este lote NO constituye defecto mientras la implementación no contradiga su incorporación futura.

No se declarará R05 como completamente implementado en la evidencia.

#### R06 — cobertura del lote

Para la evidencia actual se requiere:

- nivel actual Intermedio;
- 5 de 12 ejercicios completados;
- 42 % de progreso académico;
- coherencia entre conteo y porcentaje;
- progreso académico independiente de XP;
- conservación del acceso existente a Detalle del progreso.

La alineación funcional completa de Detalle del progreso se realizará en su lote correspondiente.

---

# 7. Alcance canónico de Home/Ruta

Después del lote:

`home.html`

será la **única pantalla funcional canónica Home/Ruta**.

Home y Ruta NO son destinos separados.

La composición objetivo es conceptualmente:

```text
Header existente de Home
        ↓
Resumen académico adaptado
        ↓
Árbol existente de Ruta integrado
        ↓
Bottom Navigation transversal
```

No crear una nueva pantalla.

No crear un nuevo diseño.

No crear una tercera implementación.

---

# 8. Home existente — elementos que se conservan

Conservar siempre que sean compatibles:

- Header existente;
- avatar/perfil;
- marca MusicAI;
- Notificaciones;
- contenedor principal;
- lenguaje visual;
- tarjeta de progreso como base de presentación;
- enlace existente a Detalle del progreso;
- comportamiento existente del panel de Notificaciones;
- integración existente con `assistant-panel.*`.

Perfil continúa navegando a su pantalla existente si actualmente lo hace.

Detalle del progreso continúa navegando a su pantalla existente.

No sustituir estos accesos por simulaciones.

---

# 9. Home existente — elementos que deben retirarse por desalineación

Eliminar de la Home canónica únicamente porque ya no corresponden al modelo funcional vigente:

- saludo grande histórico;
- subtítulo dependiente de ese saludo;
- Quick Actions;
- Recent Activity;
- siguiente logro;
- temporizador `13:31`;
- texto `Faltan 190 XP`;
- XP utilizado como representación del progreso académico;
- XP semanal presentado como progreso;
- pestaña/destino separado `Ruta`;
- etiqueta `Inicio` como destino canónico.

No reemplazar estos bloques por contenido inventado.

El espacio liberado se utilizará naturalmente para integrar el árbol existente.

---

# 10. Resumen de progreso académico

Conservar la tarjeta/estética existente de Home como base.

Modificar únicamente su contenido y semántica para mostrar:

- Nivel actual: `Intermedio`;
- `5 de 12 ejercicios completados`;
- `42 %`.

El porcentaje debe corresponder a:

`5 / 12 = 41,67 % → 42 %`

Reglas:

- progreso académico ≠ XP;
- progreso académico ≠ XP semanal;
- progreso académico ≠ racha;
- progreso académico ≠ logros;
- progreso académico ≠ desafíos.

No utilizar `65 %`.

No mostrar `350 / 540 XP` como progreso académico.

No rediseñar la tarjeta si basta con cambiar contenido y retirar componentes obsoletos.

---

# 11. Dataset demostrativo autorizado

Mantener el mismo dataset funcional consolidado para MusicAI.

## 11.1 Niveles

1. Básico — completado.
2. Elemental — completado.
3. Intermedio — actual.
4. Avanzado — bloqueado.
5. Experto — bloqueado.

## 11.2 Intermedio

Lecciones:

1. Cadencias funcionales — completada.
2. Acordes con séptima — activa.
3. Progresiones armónicas — bloqueada.

## 11.3 Acordes con séptima

Ejercicios:

1. Identificar acordes con séptima — completado.
2. Construir progresión ii-V-I — actual.
3. Ejecutar cadencia en guitarra — bloqueado.
4. Evaluación interactiva — bloqueado.

## 11.4 Dataset estructural para cálculo

Cadencias funcionales:

- Ejercicio 1 — completado.
- Ejercicio 2 — completado.
- Ejercicio 3 — completado.
- Ejercicio 4 — completado.

Progresiones armónicas:

- Ejercicio 1 — bloqueado.
- Ejercicio 2 — bloqueado.
- Ejercicio 3 — bloqueado.
- Ejercicio 4 — bloqueado.

Estos nombres son exclusivamente estructurales.

No inventar contenido pedagógico adicional.

## 11.5 Cálculos

- Cadencias funcionales: 4/4 = 100 %.
- Acordes con séptima: 1/4 = 25 %.
- Progresiones armónicas: 0/4 = 0 %.
- Intermedio: 5/12 = 42 %.

El cálculo podrá mantenerse en JavaScript de forma simple.

No crear una arquitectura de datos nueva innecesariamente.

---

# 12. Preservación del árbol existente

La integración del árbol NO autoriza su rediseño.

ForgeB debe reutilizar el markup, clases, estructura y reglas CSS existentes de `learning-path.html` / `learning-path.css` en la mayor medida posible.

La adaptación esperada es:

- mover/integrar el árbol dentro de Home;
- actualizar valores;
- actualizar estados;
- actualizar links bloqueados;
- retirar componentes incompatibles;
- adaptar únicamente lo indispensable para convivir con el Header y Home.

No:

- cambiar el layout de tarjetas;
- transformar las tarjetas en otro diseño;
- crear botones cuadrados flotantes no existentes;
- cambiar la tipografía;
- alterar la escala visual;
- convertir el árbol en una lista genérica;
- sustituir nodos por cards nuevas;
- eliminar la línea de recorrido;
- sustituir los círculos numerados;
- copiar la apariencia Flutter.

---

# 13. Estado inicial del árbol

Al entrar a Home/Ruta:

- Intermedio aparece identificado como nivel actual.
- Intermedio aparece expandido.
- Acordes con séptima aparece como lección activa.
- Acordes con séptima aparece expandida.
- Construir progresión ii-V-I aparece identificado como ejercicio actual.
- Básico aparece completado.
- Elemental aparece completado.
- Avanzado aparece bloqueado.
- Experto aparece bloqueado.
- Progresiones armónicas aparece bloqueada.

Cadencias funcionales podrá conservar el patrón de expansión acordado siempre que no altere visualmente el árbol.

---

# 14. Ejercicios y navegación

Conservar la navegación real existente hacia:

`interactive-exercise.html`

para ejercicios habilitados.

### 14.1 Ejercicios habilitados

Pueden navegar:

- Identificar acordes con séptima;
- Construir progresión ii-V-I.

No rediseñar `interactive-exercise.html` en este lote.

### 14.2 Ejercicios bloqueados

NO navegan:

- Ejecutar cadencia en guitarra;
- Evaluación interactiva.

El bloqueo debe ser funcional y accesible:

- no `href` funcional hacia Ejercicio;
- no activación mediante mouse;
- no activación mediante teclado;
- estado visual coherente con el árbol existente.

No basta con `pointer-events: none`.

### 14.3 Progresiones armónicas

La lección permanece bloqueada.

Sus ejercicios estructurales participan en el cálculo, pero no necesitan mostrarse mientras la lección permanezca bloqueada.

---

# 15. Contenido pedagógico histórico

No inventar nuevos nombres, conceptos o descripciones pedagógicas.

Las descripciones históricas existentes no deben utilizarse como autorización para crear contenido nuevo.

Regla:

- si un texto histórico no contradice ninguna fuente vigente y no requiere modificación para el lote, puede permanecer;
- si contradice las HU/Baseline, modificar o retirar únicamente ese texto;
- no ampliar contenidos por inferencia.

Básico y Elemental no requieren que se invente contenido interno adicional.

Avanzado y Experto tampoco.

---

# 16. Learning Path histórico

Después de integrar el árbol en Home, `learning-path.html` no debe continuar funcionando como una segunda Ruta canónica.

Modificar únicamente:

`02_Source/pages/learning-path.html`

para convertirlo en una página mínima de compatibilidad que redirija a:

`home.html`

Debe funcionar también para enlaces históricos como:

`learning-path.html?continue=1`

La redirección puede usar:

`window.location.replace("home.html")`

más un fallback HTML/link simple.

No borrar:

- `learning-path.html`;
- `learning-path.css`;
- `learning-path.js`.

`learning-path.css` y `learning-path.js` quedan como referencias históricas protegidas después de reutilizar de ellos lo necesario.

No mantener dos Home/Ruta funcionales.

---

# 17. Header

Conservar el Header actual de Home.

Debe continuar mostrando:

- Perfil;
- marca MusicAI;
- Notificaciones.

### Perfil

Conservar su navegación existente hacia:

`profile.html`

No reemplazarla por simulación.

### Notificaciones

Conservar el panel existente y su comportamiento actual compatible:

- abrir;
- cerrar;
- Escape;
- clic exterior;
- recuperación de foco cuando ya exista.

No rediseñar Notificaciones en este lote.

No alinear completamente su contenido en este lote salvo que un cambio sea estrictamente necesario para integrar Home/Ruta.

---

# 18. IA MusicAI

El comportamiento existente de IA MusicAI se conserva.

Home continuará cargando y utilizando:

- `02_Source/html/assistant-panel.html`
- `02_Source/css/assistant-panel.css`
- `02_Source/js/assistant-panel.js`

Estos archivos son **protegidos y no se modifican**.

El Bottom Navigation transversal deberá generar para `IA MusicAI` el mismo contrato DOM/atributo/clase que actualmente permite a `assistant-panel.js` detectar el disparador.

ForgeB deberá inspeccionar primero el trigger real existente y reutilizarlo.

NO:

- convertir IA MusicAI en simulación genérica;
- crear otro asistente;
- crear otro modal de IA;
- modificar `assistant-panel.*`;
- sustituir la navegación/comportamiento existente.

---

# 19. Desafíos

El Bottom Navigation debe conservar navegación real hacia la página existente:

`challenges-achievements.html`

No simular Desafíos.

No modificar esa pantalla en este lote.

Aunque su contenido tenga elementos históricos pendientes de alineación, se mantiene accesible y será corregido en un lote posterior.

---

# 20. Comunidad

El Bottom Navigation debe conservar navegación real hacia:

`community.html`

No simular Comunidad.

No modificar esa pantalla en este lote.

Su alineación completa ocurrirá en un lote posterior.

---

# 21. Afinador — única simulación de navegación del lote

Afinador es la **única excepción**.

El nuevo Bottom Navigation incluye:

`Afinador`

pero NO debe navegar todavía hacia `tuner.html` como módulo canónico.

Al seleccionarlo desde Home/Ruta debe mostrarse una experiencia mínima temporal dentro del frontend existente.

Texto autorizado:

**Simulación**

`Afinador aún no está implementado.`

Puede incluir:

- icono coherente con MusicAI;
- control para regresar/cerrar.

Debe:

- preservar el estado de Home/Ruta;
- mantener la identidad visual;
- ser claramente temporal;
- ocultar o cubrir el contenido de Home mientras esté activa, de forma equivalente a una pantalla.

No debe:

- solicitar micrófono;
- mostrar medidores;
- mostrar notas detectadas;
- simular afinación;
- usar presets;
- modificar `tuner.html`;
- modificar `tuner.js`;
- modificar `tuner.css`.

No crear una simulación genérica reutilizada para IA, Desafíos o Comunidad.

**Solo Afinador usa esta advertencia en este lote.**

---

# 22. Bottom Navigation transversal

## 22.1 Objetivo arquitectónico

El Bottom Navigation existente está duplicado entre varias pantallas.

Este lote debe convertir el **Bottom Navigation visual actual** en una única fuente reutilizable para migración progresiva.

Esto es una **extracción**, NO un rediseño.

## 22.2 Archivos

Crear únicamente:

- `02_Source/js/bottom-nav.js`
- `02_Source/css/bottom-nav.css`

## 22.3 Diseño

El componente debe reproducir el Bottom Navigation existente del prototipo:

- mismo lenguaje visual;
- misma altura aproximada;
- misma estructura visual;
- mismos tamaños;
- misma tipografía;
- mismos colores;
- mismo tipo de iconos;
- mismas proporciones;
- mismos estados activo/inactivo;
- mismo comportamiento sticky/fijo que resulte compatible.

No diseñar otra barra.

No inspirarse en Flutter.

Los estilos existentes de navegación podrán extraerse desde `home.css`/`learning-path.css` hacia `bottom-nav.css`.

Al extraerlos:

- conservar los valores existentes;
- cambiar únicamente lo necesario para encapsulación/reutilización;
- retirar de `home.css` solamente las reglas ahora pertenecientes al componente, evitando duplicación.

## 22.4 Destinos canónicos

Exactamente:

1. Home
2. Afinador
3. IA MusicAI
4. Desafíos
5. Comunidad

Eliminar del componente canónico:

- Inicio;
- Ruta.

Perfil NO pertenece al Bottom Navigation.

## 22.5 Comportamiento por destino

### Home

- destino canónico `home.html`;
- en Home aparece activo;
- seleccionarlo estando en Home no debe destruir el estado de la pantalla innecesariamente.

### Afinador

- activa únicamente la simulación temporal definida en este contrato.

### IA MusicAI

- conserva el comportamiento existente del `assistant-panel`.
- no navegar a una simulación distinta.

### Desafíos

- navegación real a `challenges-achievements.html`.

### Comunidad

- navegación real a `community.html`.

## 22.6 Arquitectura del componente

Implementar con JavaScript nativo.

Interfaz mínima sugerida:

`MusicAIBottomNav.mount(host, options)`

El componente debe conocer:

- estructura;
- etiquetas;
- orden;
- iconos;
- estado activo;
- rutas canónicas generales.

Debe permitir al consumidor resolver la excepción de Afinador sin acoplarse al contenido interno de Home.

No crear framework, router ni event bus.

## 22.7 Único consumidor en este lote

Solo:

`home.html`

migra al componente transversal en este lote.

NO modificar todavía los Bottom Navigation duplicados presentes en:

- Perfil;
- Detalle del progreso;
- Ejercicio;
- Resultado;
- Desafíos;
- Comunidad;
- otras páginas.

Es esperado temporalmente que esas pantallas todavía muestren la navegación histórica.

Esto es una **transición controlada**.

---

# 23. Regla transversal para lotes futuros

A partir de este lote, `bottom-nav.js` + `bottom-nav.css` constituyen el **Bottom Navigation canónico del prototipo web MusicAI**.

En futuros lotes:

- cuando una pantalla sea alineada, deberá migrar a este mismo componente;
- no se creará otro Bottom Navigation;
- no se copiará nuevamente su markup;
- no se duplicarán nuevamente sus estilos;
- no se rediseñará por pantalla;
- cada consumidor indicará únicamente su estado activo y comportamiento contextual permitido.

El componente podrá evolucionar únicamente mediante una decisión arquitectónica aprobada.

---

# 24. Archivos autorizados

## 24.1 Modificables

ForgeB podrá modificar únicamente:

1. `02_Source/pages/home.html`
2. `02_Source/css/home.css`
3. `02_Source/js/home.js`
4. `02_Source/pages/learning-path.html`

## 24.2 Nuevos

ForgeB podrá crear únicamente:

5. `02_Source/js/bottom-nav.js`
6. `02_Source/css/bottom-nav.css`

## 24.3 Referencias de solo lectura

ForgeB podrá leer y reutilizar conceptualmente/copiando únicamente los fragmentos necesarios de:

- `02_Source/css/learning-path.css`
- `02_Source/js/learning-path.js`
- `02_Source/pages/learning-path.html` antes de convertirlo en redirect.

No modificará `learning-path.css` ni `learning-path.js`.

---

# 25. Archivos protegidos

No modificar:

- `02_Source/pages/login.html`
- `02_Source/css/login.css`
- `02_Source/js/login.js`
- `02_Source/html/assistant-panel.html`
- `02_Source/css/assistant-panel.css`
- `02_Source/js/assistant-panel.js`
- `02_Source/css/learning-path.css`
- `02_Source/js/learning-path.js`
- `02_Source/pages/profile.html`
- `02_Source/css/profile.css`
- `02_Source/pages/progress-detail.html`
- `02_Source/css/progress-detail.css`
- `02_Source/pages/interactive-exercise.html`
- `02_Source/css/interactive-exercise.css`
- `02_Source/pages/exercise-result.html`
- `02_Source/css/exercise-result.css`
- `02_Source/pages/challenges-achievements.html`
- `02_Source/css/challenges-achievements.css`
- `02_Source/pages/community.html`
- `02_Source/css/community.css`
- `02_Source/pages/tuner.html`
- `02_Source/css/tuner.css`
- `02_Source/js/tuner.js`
- ambos `index.html`;
- `03_App/**`;
- `01_Design/**`;
- requisitos;
- arquitectura;
- documentación distinta de este `current.md`;
- `AGENTS.md`;
- `CLAUDE.md`;
- README raíz;
- `.github/**`;
- `.vscode/**`;
- `.gitignore`.

Cualquier archivo no expresamente autorizado se considera protegido.

---

# 26. Disciplina de modificación

ForgeB debe editar de forma localizada.

Prohibido:

- sustituir `home.html` completo por otro documento diseñado desde cero;
- sustituir `home.css` completo;
- sustituir `home.js` completo;
- generar archivos desde plantillas nuevas;
- borrar grandes bloques compatibles solo para simplificar;
- cambiar variables globales de color/fuente sin necesidad;
- introducir un nuevo sistema visual;
- renombrar clases masivamente;
- formatear todo el archivo si eso produce un diff masivo sin valor funcional.

Cada cambio debe poder clasificarse como:

- KEEP;
- MOVE;
- MODIFY;
- DELETE por contradicción;
- CREATE estrictamente autorizado.

Si una modificación no puede justificarse con una HU, una decisión del contrato o una necesidad técnica imprescindible para integrar Home/Ruta:

NO realizarla.

---

# 27. Integración esperada paso a paso

ForgeB seguirá conceptualmente esta secuencia:

1. inspeccionar Home real;
2. inspeccionar Ruta real;
3. identificar exactamente el bloque de árbol a reutilizar;
4. identificar estilos del árbol a preservar;
5. identificar comportamiento JS mínimo necesario;
6. conservar Header de Home;
7. adaptar la tarjeta de progreso existente;
8. retirar bloques Home expresamente revocados;
9. insertar el árbol existente debajo del progreso;
10. ajustar valores y estados del árbol;
11. bloquear los dos ejercicios definidos;
12. preservar navegación real de ejercicios habilitados;
13. extraer visual y markup del Bottom Navigation existente;
14. crear `bottom-nav.css`;
15. crear `bottom-nav.js`;
16. montar el componente en Home;
17. mantener IA MusicAI conectada al asistente actual;
18. conservar links reales de Desafíos y Comunidad;
19. implementar únicamente el overlay/pantalla temporal de Afinador;
20. convertir `learning-path.html` en compatibilidad hacia Home;
21. validar visualmente contra el prototipo previo.

No invertir este flujo creando primero una pantalla nueva.

---

# 28. Validación visual obligatoria

La validación debe comprobar no solo funcionamiento sino **preservación visual**.

Antes de modificar, ForgeB deberá inspeccionar/renderizar:

- Home existente;
- Learning Path existente.

Después de modificar, comparar.

### Debe mantenerse reconocible:

- identidad MusicAI;
- tipografía;
- paleta;
- tamaño del contenedor;
- Header;
- tarjetas;
- árbol;
- línea de progreso vertical;
- círculos numerados;
- estado actual púrpura;
- completados verdes;
- bloqueados atenuados;
- indentación;
- estilo de ejercicios;
- Bottom Navigation.

Si el resultado parece una pantalla nueva en vez de una integración de las dos existentes:

**FAIL / STOP.**

---

# 29. Criterios funcionales de aceptación

El lote cumple únicamente si:

1. Login existente continúa llevando a Home sin ser modificado.
2. Home y Ruta aparecen como una sola experiencia en `home.html`.
3. El árbol visual existente está integrado en Home.
4. No existe un segundo Home/Ruta funcional en `learning-path.html`.
5. Se conservó la identidad visual del prototipo web.
6. No se copió el diseño Flutter.
7. Intermedio aparece actual.
8. Intermedio está expandido.
9. Acordes con séptima aparece activa.
10. Acordes con séptima está expandida.
11. Construir progresión ii-V-I aparece actual.
12. Básico y Elemental aparecen completados.
13. Avanzado y Experto aparecen bloqueados.
14. Intermedio muestra 5/12.
15. Intermedio muestra 42 %.
16. No aparece 65 % como progreso actual.
17. XP no se usa como progreso académico.
18. Los dos primeros ejercicios de Acordes pueden acceder al Ejercicio existente.
19. Ejecutar cadencia en guitarra no navega.
20. Evaluación interactiva no navega.
21. El Header existente se conserva.
22. Perfil conserva su navegación real.
23. Notificaciones conserva su comportamiento existente compatible.
24. Detalle del progreso conserva su navegación real.
25. IA MusicAI conserva el asistente existente.
26. Desafíos navega a su página existente.
27. Comunidad navega a su página existente.
28. Afinador es la única navegación sustituida temporalmente por simulación.
29. Afinador no entra a `tuner.html`.
30. La simulación Afinador puede cerrarse y regresar a Home.
31. Bottom Navigation contiene exactamente Home, Afinador, IA MusicAI, Desafíos y Comunidad.
32. No aparece Ruta como destino.
33. No aparece Inicio como etiqueta canónica.
34. Home aparece activo.
35. El nuevo Bottom Navigation visualmente corresponde al existente.
36. Home es el único consumidor migrado en este lote.
37. No se modificaron pantallas secundarias.
38. No se modificó `assistant-panel.*`.
39. No se modificó `learning-path.css` ni `learning-path.js`.
40. No se introdujeron dependencias nuevas.

---

# 30. Responsive y accesibilidad

Validar como mínimo:

- ancho 320 px;
- ancho aproximado 390 px;
- ancho 430 px.

Comprobar:

- sin overflow horizontal;
- árbol legible;
- Bottom Navigation no tapa contenido;
- controles utilizables;
- estados bloqueados comprensibles;
- `aria-current` en Home;
- controles accesibles por teclado cuando corresponda;
- navegación bloqueada realmente bloqueada;
- foco visible;
- cierre del Afinador temporal accesible;
- Header sin desbordamiento.

No cambiar la estética para resolver responsive si basta con una adaptación localizada.

---

# 31. Validación técnica

Antes de modificar:

```text
git status --short
git rev-parse --abbrev-ref HEAD
git rev-parse HEAD
```

Registrar el estado.

La modificación de `current.md` realizada por Juan Carlos para activar este contrato se considera cambio previo autorizado.

ForgeB no deberá modificar `current.md`.

Después de implementar:

```text
git diff --check
git diff --name-only
git status --short
```

Si Node ya está disponible:

```text
node --check 02_Source/js/home.js
node --check 02_Source/js/bottom-nav.js
```

No instalar Node si no existe.

Validar además en navegador mediante servidor HTTP estático.

---

# 32. Comprobaciones de navegación

Desde Home/Ruta comprobar:

```text
Home
→ permanece/carga home.html

Afinador
→ simulación temporal

IA MusicAI
→ comportamiento actual assistant-panel

Desafíos
→ challenges-achievements.html

Comunidad
→ community.html

Perfil
→ profile.html

Detalle del progreso
→ progress-detail.html

Ejercicio habilitado
→ interactive-exercise.html

Ejercicio bloqueado
→ sin navegación
```

Además:

```text
learning-path.html
→ home.html

learning-path.html?continue=1
→ home.html
```

---

# 33. Stop Conditions

ForgeB debe DETENERSE inmediatamente si:

- necesita rediseñar Home;
- necesita rediseñar el árbol;
- necesita reemplazar todo `home.css`;
- necesita reemplazar todo `home.js`;
- necesita cambiar la fuente tipográfica global;
- necesita cambiar la paleta global;
- necesita modificar `assistant-panel.*`;
- necesita modificar una pantalla secundaria;
- necesita modificar `learning-path.css`;
- necesita modificar `learning-path.js`;
- necesita modificar Login;
- necesita modificar Afinador histórico;
- necesita crear otra simulación distinta de Afinador;
- necesita inventar contenido pedagógico;
- necesita agregar un archivo fuera del inventario;
- necesita introducir framework o dependencia;
- Bottom Navigation no puede extraerse conservando su estilo actual;
- IA MusicAI dejaría de funcionar como actualmente;
- Desafíos o Comunidad dejarían de navegar a sus páginas;
- el árbol integrado pierde su apariencia actual;
- aparece una contradicción material entre HU, Baseline y contrato;
- se requiere una operación Git que cambie estado.

Escalamiento:

- funcionalidad → Atlas;
- arquitectura → Daedalus/Atlas;
- alcance, archivos o Git → Juan Carlos.

No resolver un STOP mediante una ampliación silenciosa del alcance.

---

# 34. Gobierno Git

Juan Carlos controla Git.

ForgeB puede ejecutar únicamente operaciones de lectura:

- `git status`;
- `git diff`;
- `git log`;
- `git show`;
- `git rev-parse`;
- `git ls-files`.

ForgeB NO ejecutará:

- `git add`;
- `git commit`;
- `git push`;
- `git pull`;
- `git reset`;
- `git restore`;
- `git checkout`;
- `git switch`;
- `git merge`;
- `git rebase`;
- `git stash`;
- `git cherry-pick`.

---

# 35. Handoff obligatorio de ForgeB

Al finalizar deberá entregar:

## A. Veredicto

Uno de:

- READY FOR ATLAS/SENTINEL
- READY WITH NON-BLOCKING OBSERVATIONS
- NOT READY

## B. Estado inicial

- rama;
- HEAD;
- `git status --short`.

## C. Archivos modificados

Inventario exacto.

## D. Archivos creados

Inventario exacto.

## E. Integración Home/Ruta

Explicar:

- qué se mantuvo;
- qué se movió;
- qué se modificó;
- qué se retiró.

## F. Preservación visual

Confirmar expresamente:

- no se rediseñó Home;
- no se rediseñó el árbol;
- no se cambió tipografía;
- no se cambió identidad visual;
- no se copió Flutter.

## G. Progreso y estados

Resultados:

- 5/12;
- 42 %;
- estados;
- bloqueos.

## H. Bottom Navigation transversal

Confirmar:

- origen visual existente;
- archivos creados;
- cinco destinos;
- IA conserva comportamiento;
- Desafíos y Comunidad conservan navegación;
- Afinador es única simulación;
- solo Home fue migrada.

## I. Learning Path legacy

Confirmar redirección a Home.

## J. Pantallas protegidas

Confirmar que no fueron modificadas.

## K. Validación

- sintaxis;
- browser;
- viewports;
- consola;
- navegación;
- responsive;
- accesibilidad relevante.

## L. Estado Git final

```text
git diff --check
git diff --name-only
git status --short
```

No hacer commit ni push.

---

# 36. Condiciones de finalización

Este lote solo queda listo para revisión cuando:

- Home/Ruta es una única pantalla;
- el diseño sigue siendo reconociblemente el prototipo original;
- el árbol original fue reutilizado;
- los valores funcionales están alineados;
- los bloqueos funcionan;
- Bottom Navigation fue extraído sin rediseño;
- IA MusicAI conserva su comportamiento;
- Desafíos conserva navegación;
- Comunidad conserva navegación;
- solo Afinador usa simulación;
- no se tocaron pantallas fuera de alcance;
- no se introdujeron dependencias;
- no existen cambios inesperados;
- las validaciones fueron ejecutadas.

La integración definitiva requiere revisión de Atlas/Sentinel y aprobación final de Juan Carlos.

---

# 37. Regla final de ejecución

**NO crear una nueva Home.**

**NO crear una nueva Ruta.**

**NO crear un nuevo diseño.**

**NO reconstruir el frontend.**

La tarea consiste únicamente en:

> **tomar el Home existente + tomar el árbol existente de Ruta + integrarlos + ajustar los puntos que contradicen las HU + extraer el Bottom Navigation existente como componente transversal.**

Todo lo demás queda fuera de alcance.
