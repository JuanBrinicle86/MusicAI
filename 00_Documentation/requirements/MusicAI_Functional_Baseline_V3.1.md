# MusicAI — Bitácora Funcional y Línea Base para Codificación

**Versión:** V3.1  
**Fecha de corte:** 16 de agosto de 2026  
**Proyecto:** MusicAI  
**Programa:** SENA — Análisis y Desarrollo de Software (ADSO)  
**Aprendiz:** Juan Carlos Carvajal — Ficha 3336142  
**Alcance:** Historias de usuario canónicas R01–R40, navegación global, Focus Mode, Tuner Focused Experience, decisiones de UX/prototipo y restricciones funcionales vigentes para codificación.  
**Estado:** Línea base funcional R01–R40 actualizada y vigente para codificación controlada. V3.1 sustituye operativamente a V3.0 e incorpora la actualización aprobada de R39–R40 y del UX del Afinador. Este documento no sustituye al repositorio real ni a los planes técnicos por lote.

---

## 1. Propósito de esta versión

La Bitácora Funcional V3.1 reemplaza operativamente a la V3.0 como fuente vigente de decisiones funcionales y de prototipo para la fase de codificación de MusicAI.

La V3.0 consolidó el cierre funcional R01–R40. La V3.1 mantiene ese mismo alcance cerrado y sincroniza las decisiones posteriores aprobadas sobre R39–R40 y el Afinador: identificación automática de la cuerda pulsada, experiencia enfocada propia del Afinador, nuevo sistema visual de cuerdas y referencia UX aprobada. También registra como deuda visual controlada la alineación posterior del Ejercicio interactivo con el nuevo color canónico de la 6.ª cuerda.

**Cambios consolidados en V3.1:**

- R39 elimina la selección manual de cuerda y pasa a identificación automática de la cuerda pulsada mediante señal + preset activo.
- El prototipo HTML simula esa detección mediante interacción con la representación de la cuerda, sin presentarla como selector manual.
- El Afinador usa una **Tuner Focused Experience** distinta de Focus Mode: sin Header global ni Bottom Navigation mientras está abierto y con salida X/cancelar al contexto anterior.
- `01_Design/mockups/3p-afinador.png` es la referencia visual aprobada del Afinador.
- El sistema visual del Afinador adopta la 6.ª cuerda E grave en violeta de marca `#8B5CF6`; las demás conservan sus colores aprobados.
- El Ejercicio interactivo debe alinearse posteriormente con ese mismo sistema visual, mediante un Task Contract separado. Hasta entonces, la diferencia de la 6.ª cuerda se considera deuda visual controlada, no un segundo canon permanente.

Esta bitácora debe utilizarse para:

- conservar la línea funcional aprobada;
- orientar la revisión del prototipo y la implementación;
- impedir que decisiones históricas vuelvan a introducirse por error;
- mantener coherencia entre historias de usuario, navegación, UX, arquitectura y código;
- separar con claridad decisiones funcionales de instrucciones técnicas específicas del repositorio.

## 2. Gobernanza documental

### 2.1 Separación obligatoria de artefactos

| Nivel | Artefacto | Contenido permitido | Contenido excluido |
|---|---|---|---|
| 1 | Historias de usuario canónicas | Necesidad funcional, rol, propósito, precondiciones, criterios mínimos verificables y relaciones de navegación. | Layout detallado, selectores, CSS, archivos, commits o instrucciones para agentes. |
| 2 | Bitácora Funcional | Decisiones de UX/prototipo, elementos agregados/eliminados/reubicados, reglas transversales, límites del MVP y decisiones revocadas. | Código listo para insertar o plan técnico por archivo. |
| 3 | Prompt / Plan técnico de codificación | Auditoría del repositorio, archivos afectados, riesgos, secuencia, pruebas, commits y división de trabajo entre agentes. | Redefinir requisitos o ampliar el alcance funcional sin aprobación. |
| 4 | Repositorio real | Implementación efectiva, estructura, rutas, componentes, estado técnico y documentación versionada. | No debe reinterpretar requisitos por conveniencia técnica. |

### 2.2 Jerarquía de fuentes de verdad

Cuando exista contradicción:

1. **Repositorio real y commit exacto:** fuente técnica del estado implementado.
2. **Historias de usuario canónicas R01–R40:** fuente funcional verificable.
3. **Bitácora Funcional V3.1:** decisiones vigentes de UX, navegación y alcance.
4. **Arquitectura técnica vigente:** restricciones y diseño estructural.
5. **Prompt/plan técnico vigente del lote:** instrucciones de implementación autorizadas.
6. **Artefactos históricos:** referencia documental, nunca fuente vigente si contradicen los niveles anteriores.

---

## 3. Línea base canónica R01–R40

| HU | Pantalla / alcance | Necesidad canónica | Estado |
|---|---|---|---|
| R01 | Login | Registrar un usuario nuevo. | Aprobada |
| R02 | Login | Iniciar sesión con correo y contraseña. | Aprobada |
| R03 | Login | Recuperar la contraseña. | Aprobada |
| R04 | Home/Ruta | Continuar el proceso de aprendizaje. | Aprobada |
| R05 | Home/Ruta | Consultar y explorar la ruta de aprendizaje. | Aprobada |
| R06 | Home/Ruta | Consultar el resumen del progreso académico. | Aprobada |
| R07 | Navegación transversal | Navegar hacia los módulos principales. | Aprobada |
| R08 | Home/Ruta | Acceder a las notificaciones. | Aprobada |
| R09 | Home/Ruta / IA | Consultar información contextual de Nivel o Lección mediante IA MusicAI. | Aprobada |
| R10 | Ejercicio interactivo | Iniciar y realizar un ejercicio interactivo. | Aprobada |
| R11 | Ejercicio interactivo | Pausar, reanudar, reiniciar o abandonar el intento. | Aprobada |
| R12 | Home/Ruta / IA — Ejercicio | Consultar información contextual de un ejercicio mediante IA MusicAI antes de acceder a su ejecución. | Corregida y aprobada |
| R13 | Ejercicio interactivo | Finalizar automáticamente y evaluar el ejercicio. | Aprobada |
| R14 | Resultado del ejercicio | Consultar el resultado y la retroalimentación del ejercicio. | Aprobada |
| R15 | Resultado del ejercicio | Consultar la XP obtenida y el avance académico generados por el ejercicio. | Corregida y aprobada |
| R16 | Resultado del ejercicio | Seleccionar una acción después del resultado. | Aprobada |
| R17 | Detalle del progreso | Consultar el detalle del progreso académico. | Aprobada |
| R18 | Detalle del progreso | Consultar el historial de aprendizaje. | Aprobada |
| R19 | Detalle del progreso | Consultar fortalezas y aspectos por reforzar. | Aprobada |
| R20 | Asistente MusicAI | Consultar al Asistente MusicAI respetando los estados de Focus Mode. | Corregida y aprobada |
| R21 | Asistente MusicAI | Mantener una conversación con contexto. | Corregida y aprobada |
| R22 | Asistente MusicAI | Solicitar recomendaciones o ejercicios personalizados. | Aprobada |
| R23 | Asistente MusicAI | Solicitar ayuda y acciones básicas sobre MusicAI. | Aprobada |
| R24 | Asistente MusicAI | Gestionar conversaciones y recursos desde Nuevo chat y Biblioteca. | Aprobada |
| R25 | Asistente MusicAI | Configurar el asistente. | Aprobada |
| R26 | Asistente MusicAI | Gestionar la memoria contextual del estudiante. | Aprobada |
| R27 | Desafíos y Logros | Consultar XP y racha. | Aprobada |
| R28 | Desafíos y Logros | Consultar y completar desafíos y recibir recompensas especiales. | Aprobada |
| R29 | Desafíos y Logros | Consultar logros obtenidos y pendientes. | Aprobada |
| R30 | Comunidad | Consultar el ranking semanal. | Aprobada |
| R31 | Comunidad | Gestionar contactos de la comunidad. | Aprobada |
| R32 | Comunidad | Participar en retos compartidos. | Aprobada |
| R33 | Comunidad | Consultar perfil comunitario, logros visibles y posición en ranking. | Aprobada |
| R34 | Perfil | Consultar el perfil personal. | Aprobada |
| R35 | Perfil | Modificar los datos básicos del perfil. | Aprobada |
| R36 | Notificaciones | Consultar y gestionar notificaciones y su estado de lectura. | Aprobada |
| R37 | Notificaciones | Acceder al contenido relacionado desde una notificación. | Aprobada |
| R38 | Notificaciones / IA | Recibir recomendaciones personalizadas de IA MusicAI mediante notificaciones. | Aprobada |
| R39 | Afinador | Afinar una cuerda mediante el micrófono, permitiendo que MusicAI identifique automáticamente la cuerda pulsada y la compare con la frecuencia y la nota objetivo del preset activo. | Corregida y aprobada |
| R40 | Afinador | Seleccionar una afinación predefinida para la guitarra. | Aprobada |

---

## 4. Arquitectura funcional de navegación vigente

### 4.1 Shell global estándar

**Header compartido**

- Perfil
- Notificaciones

**Bottom Navigation**

1. Home
2. Afinador
3. IA MusicAI
4. Desafíos
5. Comunidad

Header y Bottom Navigation son componentes globales reutilizables, pero su visibilidad depende del contexto. No deben forzarse en estados que requieran una interfaz específica.

**Visibilidad contextual aprobada**

- Durante la ejecución activa del Ejercicio interactivo se aplica **Focus Mode** (§4.2).
- Mientras el Afinador está abierto se aplica **Tuner Focused Experience / Experiencia enfocada del Afinador**: no se muestran Header global, Perfil, Notificaciones, nombre/logo MusicAI ni Bottom Navigation. La salida se realiza mediante X/cancelar y devuelve al contexto autenticado anterior.
- **Tuner Focused Experience y Focus Mode son conceptos distintos.** Focus Mode continúa reservado exclusivamente para la ejecución activa del Ejercicio interactivo.

### 4.2 Excepción crítica: Focus Mode

Durante la **ejecución activa** de un Ejercicio interactivo:

- no se muestra el Header global;
- no se muestra el Bottom Navigation;
- no existe acceso a IA MusicAI;
- no existe acceso a Perfil;
- no existe acceso a Notificaciones;
- no existe acceso a Afinador;
- no existe acceso a Desafíos;
- no existe acceso a Comunidad.

Permanecen únicamente los recursos y controles propios del ejercicio.

### 4.3 Flujo principal aprobado

```text
Login
  ↓
Home/Ruta
  ↓
Nivel desplegado
  ↓
Lección desplegada
  ↓
Ejercicio habilitado
  ↓
Ejercicio interactivo — preparación
  ↓
Iniciar ejercicio
  ↓
Ejecución activa — Focus Mode
  ↓
Última actividad
  ↓
Evaluación automática
  ↓
Resultado del ejercicio
  ↓
Siguiente ejercicio | Repetir ejercicio | IA MusicAI
```

Flujos complementarios:

```text
Home/Ruta ↔ Detalle del progreso
Home/Ruta ↔ IA MusicAI mediante Info de Nivel/Lección/Ejercicio
Resultado ↔ IA MusicAI
Pantallas estándar ↔ Perfil
Pantallas estándar ↔ Notificaciones
Pantallas con Bottom Navigation → Afinador
Afinador — Tuner Focused Experience → X/cancelar → contexto autenticado anterior
Pantallas con Bottom Navigation ↔ IA / Desafíos / Comunidad / Home
```

---

## 5. Decisiones funcionales y de prototipo vigentes

### 5.1 Login — R01–R03

- El MVP utiliza únicamente correo electrónico y contraseña.
- Google, Apple y otros proveedores externos deben retirarse del prototipo.
- Registro con datos mínimos y regreso a Login al completar correctamente.
- Recuperación de contraseña se mantiene como un flujo funcional único.
- Mostrar/ocultar contraseña es un control de R02, no una HU independiente.
- Términos de uso y Política de privacidad son accesos secundarios.
- Inicio de sesión satisfactorio dirige a Home/Ruta.

**Anomalía documental conocida:** en la evidencia académica final, el subbloque de validación `PROTOTIPO` de R03 contiene precondiciones/resultados pertenecientes a generación de ejercicios. No utilizar ese bloque erróneo como requisito. Para R03 prevalecen su historia, criterios de aceptación y navegación.

### 5.2 Home/Ruta — R04–R09 y R12

- Home y Ruta forman una única experiencia conceptual: **Home/Ruta**.
- Nivel y Lección son agrupadores desplegables, no pantallas independientes.
- Jerarquía: Nivel → Lección → Ejercicio.
- Mostrar nivel actual, lección activa y primer ejercicio pendiente.
- Solo ejercicios habilitados permiten acceso.
- Seleccionar un ejercicio habilitado abre Ejercicio interactivo directamente en estado de preparación.
- El resumen de progreso es exclusivamente académico.
- No calcular progreso con XP.
- Actividad reciente pertenece a Detalle del progreso.
- Eliminar/no reintroducir: acciones rápidas, saludo grande, racha, próximo logro, hora decorativa, mensajes extensos, tarjetas duplicadas y flecha de regreso innecesaria.
- Info de Nivel y Lección abre IA MusicAI con consulta contextual automática.
- **R12 corregida:** Info del Ejercicio aparece en Home/Ruta, junto al nombre del ejercicio, antes de acceder a él.
- Abrir Info de Ejercicio no abre el ejercicio, no crea intento, no modifica progreso y no otorga XP.
- Al volver desde IA, Home/Ruta conserva el contexto previo de expansión/navegación.

### 5.3 Ejercicio interactivo — R10, R11 y R13

- Preparación y ejecución pertenecen a la misma pantalla.
- Abrir el ejercicio no inicia automáticamente el intento.
- Iniciar ejercicio es una acción explícita del estudiante.
- Solicitar micrófono solo cuando el ejercicio lo requiera.
- La ejecución debe priorizar partitura, tablatura, mástil/diapasón y feedback útil en tiempo real.
- Permitir pausar/reanudar conservando estado.
- Al pausar, detener avance, captura y análisis relacionados.
- Reiniciar vuelve a la primera actividad y descarta el intento parcial.
- Abandonar exige confirmación y regresa a Home/Ruta sin progreso ni XP del intento incompleto.
- No existe botón Pista.
- No existe botón Finalizar.
- Completar la última actividad finaliza automáticamente, detiene captura/análisis/temporizador si aplica, evalúa y abre Resultado.
- Si falla la evaluación, informar y no registrar progreso ni XP.
- No existe botón Info dentro del Ejercicio interactivo.
- Durante ejecución activa se aplica Focus Mode.
- Eliminar racha, XP, puntos y temporizador general del bloque superior.
- Temporizador solo cuando la actividad sea explícitamente cronometrada.
- Las estadísticas acumuladas pertenecen a Resultado, no a la ejecución.
- El HUD debe ser compacto y mostrar únicamente información útil para corregir: esperado, detectado, correcto/incorrecto y afinación/ritmo/digitación cuando corresponda.
- El progreso mostrado durante la ejecución es progreso interno del ejercicio, no progreso general de la lección.
- El sistema visual de seis cuerdas del Ejercicio interactivo debe alinearse con el canon compartido definido en §5.11: 6.ª E grave `#8B5CF6` violeta, 5.ª A `#F59E0B`, 4.ª D `#84CC16`, 3.ª G `#22D3EE`, 2.ª B `#FBBF24` y 1.ª e agudo `#F87171`.
- La implementación actual del Ejercicio interactivo puede conservar temporalmente la 6.ª cuerda azul hasta ejecutar su Task Contract específico. Esa diferencia es deuda visual controlada y no autoriza a modificar el Ejercicio dentro del lote del Afinador.

### 5.4 Resultado del ejercicio — R14–R16

- Resultado solo aparece después de una evaluación procesada correctamente.
- Mostrar resultado general y métricas correspondientes al mismo intento.
- Retroalimentación breve sobre aciertos y aspectos por mejorar.
- Fusionar Puntuación general y Progreso de la lección en un bloque académico **Resultado y avance**.
- El avance académico se calcula por actividades académicas completadas.
- Todo ejercicio completado correctamente otorga XP.
- Los ejercicios normales no otorgan recompensas especiales de inventario.
- Multiplicadores X2/X3, protectores de racha y equivalentes pertenecen exclusivamente a Desafíos.
- Eliminar Resumen de ejecución como tarjeta independiente.
- Integrar errores/imprecisiones relevantes en Diagnóstico MusicAI o detalle secundario.
- Mantener Diagnóstico MusicAI como bloque pedagógico independiente.
- Evitar chip superior duplicado de XP.
- Acciones posteriores: Siguiente ejercicio, Repetir ejercicio e IA MusicAI.
- Siguiente ejercicio solo si existe uno habilitado.
- Repetir crea un nuevo intento y no altera el resultado histórico anterior.
- IA recibe contexto del ejercicio y del resultado sin modificar datos ya registrados.

### 5.5 Detalle del progreso — R17–R19

- Mostrar nivel actual, porcentaje académico y avance por lecciones.
- El avance de una lección se basa en ejercicios completados frente al total correspondiente.
- Incluir historial de aprendizaje y actividad reciente.
- Mostrar fortalezas y aspectos por reforzar basados en datos reales.
- No declarar debilidades cuando no exista evidencia suficiente.
- Permitir recomendaciones breves de MusicAI.
- XP, racha y tiempo de estudio no son elementos principales.
- Consultar la pantalla no modifica progreso ni gamificación.

### 5.6 Asistente MusicAI — R20–R26

- Es un objeto transversal del entorno autenticado estándar.
- No está disponible durante Focus Mode.
- Responde sobre aprendizaje musical y funcionamiento de MusicAI.
- No es un asistente generalista.
- Mantiene contexto durante una conversación activa.
- Puede recibir contexto de Nivel, Lección o Ejercicio desde Home/Ruta mediante Info.
- Puede recibir contexto desde Resultado.
- Puede generar recomendaciones y ejercicios personalizados sin completar actividades ni alterar progreso automáticamente.
- Puede ejecutar únicamente acciones básicas pertenecientes a un catálogo permitido.
- Las acciones que modifiquen estado o datos deben estar definidas y solicitar confirmación cuando corresponda.
- Navegación interna: Nuevo chat, Biblioteca y Configuración del asistente.
- Proyectos se elimina del MVP.
- Biblioteca y memoria contextual son conceptos distintos.
- La memoria contextual es voluntaria.
- El estudiante debe solicitar explícitamente que algo sea recordado.
- Debe poder consultar recuerdos, eliminar uno específico o borrar toda la memoria.
- Borrar memoria no elimina Biblioteca, progreso ni resultados.
- Mantener un ejemplo de conversación que demuestre contexto académico, recomendación personalizada, memoria voluntaria y acción autorizada.

### 5.7 Desafíos y Logros — R27–R29

- Mostrar XP total acumulada y racha actual.
- XP y racha son gamificación, no progreso académico.
- Todos los ejercicios completados correctamente otorgan XP.
- Desafíos son metas definidas por MusicAI.
- Cada desafío tiene objetivo, condición, progreso y recompensa cuando aplique.
- Solo Desafíos otorgan recompensas especiales de inventario.
- Recompensas especiales aprobadas como ejemplo: multiplicadores temporales X2/X3 y protectores de racha.
- La recompensa se entrega una sola vez.
- Logros son hitos/reconocimientos obtenidos y pendientes.
- Logros no otorgan recompensas especiales salvo decisión futura.
- No implementar tienda, monedas, canje, temporadas, desafíos creados por el usuario ni reclamación manual.

### 5.8 Comunidad — R30–R33

- Comunidad es una capa social ligera.
- Ranking semanal se basa en XP obtenida durante el periodo semanal vigente.
- XP semanal y XP total acumulada son métricas distintas.
- Gestionar contactos mediante solicitud, aceptación/rechazo y eliminación.
- Evitar solicitudes duplicadas.
- Retos compartidos usan una meta común con progreso individual por participante.
- Perfil comunitario es de solo lectura.
- Mostrar únicamente información autorizada, logros visibles y posición semanal cuando aplique.
- No exponer correo ni otros datos privados.
- No implementar publicaciones, comentarios, likes, chat social, grupos, seguidores ni feed.

### 5.9 Perfil — R34–R35

- Perfil y Configuración de Perfil se consolidan en **una sola pantalla** para el MVP.
- No existe una pantalla independiente de Configuración de Perfil.
- Acceso mediante Header global cuando corresponda.
- Mostrar nombre del perfil, foto/avatar y correo electrónico.
- Permitir modificar nombre.
- Permitir cambiar foto/avatar.
- Permitir solicitar cambio de correo.
- Validar formato antes de guardar.
- El correo debe tener formato válido y no estar asociado a otra cuenta.
- Informar éxito.
- Ante error, conservar los datos previos.
- Los cambios de Perfil no afectan progreso, XP, racha, logros ni resultados.
- El correo y demás información privada del perfil propio no deben exponerse en el perfil comunitario.

### 5.10 Notificaciones — R36–R38

- Bandeja única y centralizada.
- Orden de más reciente a más antigua.
- Estados únicamente: leída / no leída.
- Abrir una notificación la marca como leída.
- Permitir **Marcar todas como leídas** sin eliminarlas.
- Las notificaciones permanecen disponibles para consulta posterior.
- Mostrar estado vacío cuando no existan.
- No incluir en el MVP: prioridad compleja, carpetas, archivo, borrado, silenciamiento ni preferencias por categoría.
- Una notificación puede abrir contenido relacionado cuando exista un destino válido.
- Si el destino no está disponible, informar sin producir navegación rota.
- Abrir una notificación no modifica progreso, XP o recompensas.
- IA MusicAI puede generar notificaciones pedagógicas relevantes: ejercicios recomendados/personalizados, refuerzo, temas por profundizar, contexto teórico, recomendaciones de estudio y tips.
- Las recomendaciones basadas en desempeño deben usar datos reales.
- No existe una frecuencia fija obligatoria.
- La generación se basa en eventos o recomendaciones relevantes.
- Cuando R38 tenga una acción asociada, la navegación se rige por R37.

### 5.11 Afinador — R39–R40

- Herramienta transversal accesible desde Bottom Navigation en las pantallas estándar autorizadas.
- Mientras está abierto utiliza **Tuner Focused Experience / Experiencia enfocada del Afinador**: no muestra Header global, Perfil, Notificaciones, nombre/logo MusicAI ni Bottom Navigation.
- Tuner Focused Experience no es Focus Mode. Focus Mode sigue reservado para la ejecución activa del Ejercicio interactivo.
- La salida del Afinador se realiza mediante X/cancelar y devuelve al contexto autenticado anterior.
- El producto real funciona mediante micrófono, sin cable, y no almacena permanentemente el audio utilizado para la detección.
- MusicAI identifica automáticamente la cuerda pulsada a partir de la señal detectada y de la afinación predefinida activa. **No existe selección manual de cuerda como comportamiento de producto.**
- El sistema analiza la frecuencia y la nota producidas, identifica la cuerda correspondiente y las compara con la frecuencia y la nota objetivo del preset activo.
- En el prototipo HTML no existe DSP real: hover, click/tap, focus o activación por teclado sobre la representación de una cuerda simulan que MusicAI identificó automáticamente esa cuerda. La interfaz no debe presentar esta interacción como un selector manual.
- La información principal del Afinador debe ser compacta e intuitiva: preset activo, A440 fijo, nota/frecuencia, gauge **Grave – En tono – Agudo** y representación de pala/diapasón con seis cuerdas y clavijas.
- No mostrar tarjetas o textos redundantes como Cuerda seleccionada, Selecciona la cuerda, Referencia, Estado esperando señal o Activar señal simulada.
- El estado inicial del prototipo puede ser neutro, sin presentar falsamente una cuerda como afinada. En producto real, si la señal es insuficiente o ambigua, no debe presentarse una afinación incorrecta como válida.
- Nota detectada, frecuencia mostrada, posición del gauge y estado deben ser coherentes entre sí. Un valor exacto de la frecuencia objetivo implica indicador centrado/En tono; una desviación Grave o Aguda debe reflejarse también en los datos mostrados o identificarse explícitamente como referencia objetivo.
- La cuerda identificada se distingue visualmente de las demás. Nota/círculo, cuerda física, clavija y check deben compartir la misma identidad cromática y corresponder a la misma cuerda.
- Solo la cuerda activa tiene glow dominante.
- Cuando una cuerda alcanza correctamente su objetivo, puede marcarse mediante un check discreto; la ubicación de los checks debe ser consistente y simétrica.
- El grosor visual de las cuerdas respeta el instrumento real: 6.ª más gruesa y reducción progresiva hasta la 1.ª, la más delgada.
- **Sistema visual canónico compartido de seis cuerdas:**
  - 6.ª E grave: `#8B5CF6` — violeta de marca.
  - 5.ª A: `#F59E0B` — naranja.
  - 4.ª D: `#84CC16` — verde.
  - 3.ª G: `#22D3EE` — cian.
  - 2.ª B: `#FBBF24` — amarillo.
  - 1.ª e agudo: `#F87171` — coral/rojo.
- El Afinador adopta inmediatamente este sistema. El Ejercicio interactivo debe alinearse posteriormente al mismo canon mediante un Task Contract separado; la divergencia temporal de la 6.ª cuerda es deuda visual controlada.
- A4 = 440 Hz fijo en el MVP.
- No mostrar control Calibrate.
- Afinaciones aprobadas:
  - E Standard: E A D G B E
  - Eb Standard: Eb Ab Db Gb Bb Eb
  - D Standard: D G C F A D
  - Drop D: D A D G B E
  - C Standard: C F Bb Eb G C
  - Drop C: C G C F A D
- Cambiar el preset actualiza las seis notas objetivo sin abandonar el Afinador; la cuerda identificada automáticamente usa el objetivo correspondiente al preset activo.
- No permitir afinaciones personalizadas en el MVP.
- Preparar la estructura para ampliar presets posteriormente solo cuando exista una necesidad aprobada.
- `01_Design/mockups/3p-afinador.png` es la referencia visual aprobada del Afinador. Las referencias externas son inspiración funcional y no diseños para copiar.
- Cuando el Afinador aparezca como destino de navegación, su icono debe representar afinación (por ejemplo, diapasón/tuning fork). Dentro de Tuner Focused Experience no se muestra ese destino.
- No utilizar el símbolo de metrónomo para Afinador; reservarlo para una posible herramienta futura.

## 6. Decisiones expresamente reemplazadas o revocadas

| Decisión histórica | Decisión vigente |
|---|---|
| Ruta es una pantalla/destino independiente. | Ruta se integra en Home/Ruta. |
| Nivel y Lección son pantallas independientes. | Son agrupadores dentro de Home/Ruta. |
| Perfil reemplaza Ruta en Bottom Navigation. | Afinador ocupa el destino liberado; Perfil está en Header. |
| Perfil y Notificaciones solo aparecen en Home. | Forman parte del Header global de pantallas estándar, con visibilidad contextual. |
| Perfil y Configuración de Perfil son pantallas separadas. | Una sola pantalla Perfil cubre R34–R35. |
| IA está visible en todas las pantallas autenticadas sin excepción. | IA es transversal, excepto durante Focus Mode. |
| Info del ejercicio está dentro de Ejercicio interactivo y puede abrir IA durante el intento. | Revocado. Info del ejercicio está en Home/Ruta antes de entrar. |
| Al abrir IA durante el intento se pausa y conserva estado. | Revocado: IA no está disponible durante la ejecución activa. |
| Botón Pista dentro del ejercicio. | No existe. |
| Botón Finalizar ejercicio. | Finalización automática al completar la última actividad. |
| Progreso académico basado en XP requerida/restante. | Progreso académico por actividades/porcentaje; XP es gamificación. |
| Actividad reciente en Home. | Actividad reciente en Detalle del progreso. |
| Proyectos dentro del Asistente. | Eliminado del MVP. |
| Ejercicios normales pueden dar recompensas especiales. | Ejercicios correctos otorgan XP; recompensas especiales solo en Desafíos. |
| Afinador fuera de alcance. | Afinador forma parte del MVP mediante R39–R40. |
| Notificaciones pendientes de definir. | R36–R38 cierran el alcance del MVP. |
| Calibración visible en Afinador. | A4 = 440 Hz fijo; sin control visible de calibración. |
| Afinador con selección manual de cuerda por parte del estudiante. | R39 identifica automáticamente la cuerda pulsada; el prototipo simula esa identificación mediante interacción con la representación de la cuerda. |
| Afinador y Ejercicio interactivo con la 6.ª cuerda E grave azul / prohibición de morado. | El canon visual compartido usa E grave `#8B5CF6` violeta. El Afinador lo adopta ahora y el Ejercicio interactivo queda pendiente de alineación en un Task Contract posterior. |
| Afinador mostrado como pantalla autenticada estándar con Header y Bottom Navigation visibles durante su uso. | La pantalla activa del Afinador usa Tuner Focused Experience: sin Header, sin Bottom Navigation y con salida X/cancelar al contexto anterior. |

---

## 7. Reglas de consistencia de dominio

Durante codificación deben preservarse estas separaciones:

- progreso académico ≠ XP total;
- XP total ≠ XP semanal;
- racha ≠ progreso académico;
- Desafíos ≠ retos compartidos de Comunidad;
- Logros ≠ recompensas especiales;
- Biblioteca ≠ memoria contextual;
- Reiniciar intento ≠ Repetir ejercicio;
- Perfil propio ≠ perfil comunitario;
- notificación recibida ≠ acción ejecutada;
- cuerda identificada automáticamente ≠ nota objetivo del preset activo;
- nota objetivo ≠ nota/frecuencia detectada por el Afinador;
- interacción usada para simular detección en el prototipo ≠ selección manual de cuerda como comportamiento de producto;
- Tuner Focused Experience ≠ Focus Mode;
- canon visual compartido de cuerdas ≠ obligación de modificar dos pantallas en el mismo Task Contract;
- deuda visual temporal controlada ≠ segundo sistema visual permanente.

## 8. Restricciones del MVP

No introducir por inferencia durante codificación:

- OAuth o autenticación de terceros;
- pantalla independiente de Ruta;
- pantallas independientes de Nivel o Lección;
- pantalla independiente de Configuración de Perfil;
- Pista dentro del ejercicio;
- finalización manual del ejercicio;
- acceso global durante Focus Mode;
- Proyectos en IA MusicAI;
- memoria automática de todas las conversaciones;
- control arbitrario de la aplicación por IA;
- tienda;
- monedas;
- canje;
- temporadas;
- desafíos creados por usuarios;
- feed social;
- publicaciones;
- likes;
- comentarios;
- chat social;
- seguidores;
- grupos;
- selección manual de cuerda como comportamiento del Afinador;
- Header global o Bottom Navigation visibles dentro de la Tuner Focused Experience;
- afinaciones personalizadas;
- calibración visible del Afinador;
- grabación o almacenamiento permanente de audio;
- metrónomo como parte del alcance aprobado actual.

---

## 9. Trazabilidad hacia arquitectura

La arquitectura técnica definida continúa siendo la referencia prospectiva:

- Frontend: Flutter / Dart.
- Backend: Python / FastAPI.
- Autenticación: JWT.
- Base de datos: SQL Server.
- IA: NLP / modelos de IA / integración vía API cuando corresponda.
- Procesamiento musical: Python, Librosa, NumPy, SciPy y DSP.
- Infraestructura: Docker, Linux, APIs REST y posible despliegue cloud.
- Patrones definidos: MVC, Singleton, Factory Method, Observer, Strategy y Facade.

Durante la codificación no debe asumirse que todos estos componentes ya están implementados. El repositorio real determina qué existe hoy; la arquitectura define hacia dónde debe evolucionar la solución.

No crear entidades, endpoints o servicios solamente porque una pantalla o layout los sugiera.

---

## 10. Estado documental al inicio de la fase de codificación

### Fuente funcional canónica
- Historias de Usuario R01–R40.

### Fuente funcional/UX vigente
- Bitácora Funcional V3.1 — este documento.

### Fuente técnica previa a implementación
- Prompt Maestro ClaudeWeb V3.0, útil para la auditoría final del prototipo, pero su restricción de “no implementar” debe considerarse específica de la fase de auditoría y no convertirse en regla permanente de todo el proyecto de codificación.

### Arquitectura
- Documento de arquitectura y diagramas técnicos vigentes deben revisarse cuando la implementación real obligue a concretar decisiones todavía prospectivas.

### Site-map
- El site-map histórico no es fuente vigente.
- El site-map V2 debe representar R01–R40, Header/Bottom Navigation, R12 corregida y la excepción de Focus Mode.
- Tras la actualización de R39, cualquier referencia del site-map V2 a selección manual de cuerda queda obsoleta y debe sincronizarse en un lote documental posterior.
- El acceso global al Afinador desde Bottom Navigation continúa vigente; la pantalla activa del Afinador utiliza Tuner Focused Experience y retorna al contexto anterior mediante X/cancelar.
- Antes de usar cualquier versión visual como fuente autoritativa, debe verificarse que sus etiquetas y rangos Rxx coincidan exactamente con la línea canónica.

### Documentación del repositorio
- `CLAUDE.md`, `.github/copilot-instructions.md`, `README.md` y documentación equivalente deben alinearse con esta línea base antes de comenzar lotes de implementación que dependan de decisiones funcionales nuevas.
- Para el lote del Afinador, cualquier guardrail que todavía prescriba selección manual de cuerda, E grave azul/no-purple, reutilización exacta del sistema anterior del Ejercicio o shell global visible dentro del Afinador debe sincronizarse antes de ejecutar Forge-FE.
- El contenido versionado dentro del repositorio debe mantenerse sincronizado con el commit real.

---

## 11. Reglas para la fase de codificación

1. Auditar el repositorio real antes de planificar cada lote.
2. Mantener `main` estable.
3. Preferir flujo Issue/Tarea → Branch → commits pequeños → Pull Request → revisión → merge.
4. No ejecutar cambios funcionales grandes y refactorizaciones estructurales amplias en el mismo lote si pueden separarse.
5. No asignar a dos agentes cambios simultáneos sobre los mismos archivos sin secuencia explícita.
6. Cada lote debe indicar:
   - HU relacionadas;
   - objetivo;
   - archivos autorizados;
   - archivos que no deben tocarse;
   - dependencias;
   - comportamiento a preservar;
   - criterios de aceptación;
   - pruebas manuales/automatizadas;
   - riesgos;
   - condición de cierre.
7. Después de cada lote revisar:
   - `git diff`;
   - pruebas;
   - navegación;
   - responsive;
   - accesibilidad;
   - estados loading/error/empty/disabled;
   - working tree;
   - commit resultante.
8. Cualquier duda que cambie una HU, regla de negocio, navegación o arquitectura funcional debe regresar a decisión antes de codificarla.

---

## 12. Riesgos prioritarios para implementación

- Reintroducir decisiones obsoletas desde archivos históricos.
- Mezclar XP y progreso académico.
- Mantener accesos globales visibles durante Focus Mode.
- Confundir Tuner Focused Experience con Focus Mode o reintroducir Header/Bottom Navigation dentro del Afinador.
- Reimplementar Info dentro del Ejercicio interactivo.
- Duplicar Header/Bottom Navigation de forma inconsistente entre pantallas.
- Reintroducir selección manual de cuerda en el Afinador después de la actualización de R39.
- Perder la trazabilidad de la deuda visual entre Ejercicio interactivo y Afinador, o intentar alinearlos fuera del Task Contract previsto para ello.
- Mantener la 6.ª cuerda E grave azul en el Ejercicio interactivo indefinidamente después de establecerse el canon violeta compartido.
- Romper el natural mapping entre nota/círculo, cuerda, clavija y check del Afinador.
- Mostrar datos de frecuencia/nota que contradigan la posición del gauge o el estado Grave/En tono/Agudo.
- Acoplar IA a acciones arbitrarias sin catálogo permitido.
- Confundir memoria contextual con historial completo de conversación.
- Exponer información privada del Perfil en Comunidad.
- Crear notificaciones excesivas o duplicadas sin necesidad pedagógica.
- Presentar una afinación como válida con señal insuficiente.
- Persistir audio fuera del alcance aprobado.
- Implementar arquitectura prospectiva como si ya existiera sin verificar el repositorio.
- Convertir prototipo visual en requisito por inferencia.

## 13. Condición de cierre funcional

La definición funcional del MVP queda cerrada en **R01–R40** para iniciar la fase de codificación controlada.

A partir de V3.1:

- nuevas funciones no se agregan por inferencia;
- cualquier cambio que altere R01–R40 debe documentarse como nueva decisión y analizar su impacto;
- el repositorio debe evolucionar mediante lotes trazables;
- Bitácora, HU, navegación, arquitectura y documentación técnica deben mantenerse coherentes;
- las versiones V1.x, V2.0 y V3.0 de la bitácora quedan como historia documental y no deben utilizarse como fuente operativa cuando contradigan V3.1.

**Estado final:** línea base funcional V3.1 consolidada y apta para servir como fuente vigente del proyecto independiente **“Codificación - MusicAI”**. La actualización del Afinador queda sincronizada funcionalmente; la alineación visual de la 6.ª cuerda del Ejercicio interactivo permanece como deuda controlada para un Task Contract posterior.
