# MusicAI — Functional Baseline V3.2

**Versión:** V3.2
**Fecha de corte:** 18 de agosto de 2026
**Proyecto:** MusicAI
**Programa:** SENA — Análisis y Desarrollo de Software (ADSO)
**Alcance funcional:** R01–R40
**Fuente funcional canónica:** `user-stories-v2.xlsx`
**Estado:** Línea base funcional y UX vigente para codificación controlada. Sustituye operativamente a V3.1 una vez aprobada e integrada.

---

## 1. Propósito y alcance

Functional Baseline V3.2 establece las reglas transversales de UX, navegación, alcance y gobernanza necesarias para interpretar correctamente las Historias de Usuario R01–R40 durante la codificación de MusicAI.

Este documento **no replica las Historias de Usuario ni sus criterios de aceptación**.

Para conocer comportamiento funcional, precondiciones, resultados esperados, reglas de negocio o relaciones de navegación de una HU concreta, debe consultarse `user-stories-v2.xlsx`.

V3.2 conserva únicamente información que cumple al menos una de estas condiciones:

- aplica transversalmente a varias HU;
- define una regla de navegación o experiencia global;
- registra una decisión UX/prototipo que no corresponde duplicar dentro de cada HU;
- impide reintroducir una decisión histórica revocada;
- delimita responsabilidades entre fuentes documentales;
- registra una deuda controlada o una restricción transversal vigente.

No agregar funcionalidad por inferencia.

---

## 2. Fuentes de verdad y responsabilidad documental

Cuando exista una contradicción, aplicar el siguiente orden:

1. **Repositorio real y commit exacto:** verdad técnica de lo actualmente implementado.
2. **`user-stories-v2.xlsx`:** verdad funcional canónica R01–R40.
3. **Functional Baseline V3.2:** verdad transversal de UX, navegación, alcance y decisiones vigentes no duplicadas en las HU.
4. **Arquitectura técnica y diagramas vigentes:** dirección estructural y tecnológica.
5. **Task Contract / plan técnico aprobado del lote:** alcance operativo autorizado para la tarea vigente.
6. **Artefactos históricos:** referencia documental sin autoridad para sustituir fuentes vigentes.

### Responsabilidad por artefacto

**Historias de Usuario**
Contienen necesidad funcional, actor, propósito, criterios de aceptación, precondiciones, resultados esperados y navegación asociada.

**Functional Baseline**
Contiene únicamente decisiones transversales, UX compartida, excepciones de navegación, decisiones revocadas, restricciones globales y deudas controladas.

**Arquitectura**
Define la dirección técnica y estructural. No demuestra por sí misma que un componente ya exista en el repositorio.

**Task Contract**
Autoriza un lote concreto: objetivo, rol, archivos, alcance, pruebas, seguridad, stop conditions y handoff.

**Repositorio**
Representa el estado técnico real.

No copiar entre estos artefactos información que pueda mantenerse mediante una referencia inequívoca a su fuente canónica.

---

## 3. Alcance funcional y control de cambios

El MVP permanece cerrado en **R01–R40**.

La definición detallada de las 40 Historias de Usuario se encuentra exclusivamente en `user-stories-v2.xlsx`.

V3.2 no mantiene una tabla paralela R01–R40.

Cualquier modificación futura de una necesidad funcional, criterio de aceptación, precondición o resultado esperado debe realizarse primero en la HU correspondiente. Esta baseline solo debe actualizarse después si el cambio produce impacto transversal en UX, navegación, alcance, gobernanza, invariantes o decisiones revocadas.

Las HU nuevas no se agregan por inferencia.

---

## 4. Navegación y experiencias transversales

### 4.1 Shell autenticado estándar

En los contextos autenticados estándar, MusicAI utiliza:

**Header**

- Perfil
- Notificaciones

**Bottom Navigation**

- Home
- Afinador
- IA MusicAI
- Desafíos
- Comunidad

Las reglas funcionales de acceso y navegación asociadas se consultan en las HU correspondientes de `user-stories-v2.xlsx`.

### 4.2 Home/Ruta

Home y Ruta constituyen una única experiencia funcional denominada **Home/Ruta**.

Nivel y Lección son agrupadores de la ruta de aprendizaje y no destinos globales independientes.

La jerarquía, progreso, disponibilidad y reglas de desbloqueo se rigen por R04–R06 de `user-stories-v2.xlsx`.

### 4.3 Focus Mode

**Focus Mode** aplica exclusivamente durante la ejecución activa de un Ejercicio Interactivo.

En Focus Mode no se muestran Header ni Bottom Navigation y no se permite acceso a módulos transversales.

Los recursos y controles disponibles durante el intento se rigen por R10–R13 y las HU relacionadas.

No utilizar Focus Mode como nombre genérico para otras experiencias enfocadas.

### 4.4 Tuner Focused Experience

El Afinador utiliza una experiencia enfocada propia denominada **Tuner Focused Experience**, distinta de Focus Mode.

Mientras el Afinador está activo no se muestra el shell global y la salida devuelve al contexto autenticado anterior.

El comportamiento funcional del Afinador se rige por R39–R40.

La referencia visual aprobada del Afinador es `01_Design/mockups/3p-afinador.png` mientras no sea sustituida por una fuente posterior aprobada.

---

## 5. Invariantes transversales de dominio

Estas separaciones deben preservarse durante análisis, diseño, base de datos, implementación y pruebas:

- progreso académico ≠ XP total;
- XP total ≠ XP semanal;
- racha ≠ progreso académico;
- Desafíos ≠ retos compartidos de Comunidad;
- Logros ≠ recompensas especiales;
- Biblioteca ≠ memoria contextual;
- Biblioteca ≠ Instrucciones personalizadas;
- memoria contextual ≠ Instrucciones personalizadas;
- Reiniciar intento ≠ Repetir ejercicio;
- Perfil personal ≠ Perfil comunitario;
- notificación recibida ≠ acción ejecutada;
- cuerda identificada automáticamente ≠ objetivo del preset;
- objetivo del preset ≠ nota/frecuencia detectada;
- interacción de simulación del prototipo ≠ selección manual de cuerda en el producto;
- Tuner Focused Experience ≠ Focus Mode;
- rol del agente ≠ modelo o proveedor que lo ejecute.

Cuando se necesite conocer la regla concreta que implementa una de estas separaciones, debe consultarse la HU correspondiente en `user-stories-v2.xlsx`.

---

## 6. Decisiones históricas que no deben reintroducirse

Las siguientes decisiones o interpretaciones históricas quedan revocadas y no deben recuperarse desde versiones anteriores, prototipos, diagramas o modelos de datos antiguos:

- Ruta como destino independiente del Bottom Navigation.
- Nivel o Lección como pantallas principales independientes.
- Perfil como destino del Bottom Navigation.
- Perfil y Configuración de Perfil como pantallas separadas.
- acceso a módulos transversales durante Focus Mode;
- Info del Ejercicio dentro de la ejecución activa;
- botón Pista dentro del Ejercicio Interactivo;
- finalización manual del Ejercicio Interactivo;
- progreso académico calculado mediante XP;
- Proyectos dentro del Asistente MusicAI;
- memoria automática de conversaciones;
- persistencia automática de conversaciones no guardadas en Biblioteca;
- selección manual de modelo, proveedor o nivel de inteligencia por parte del estudiante;
- control arbitrario de la aplicación por el Asistente;
- recompensas especiales otorgadas directamente por ejercicios normales;
- X3 como recompensa vigente del MVP;
- selección manual de cuerda en el Afinador;
- calibración visible del Afinador;
- afinaciones personalizadas;
- Header o Bottom Navigation visibles durante Tuner Focused Experience;
- almacenamiento permanente del audio utilizado por el Afinador;
- roles funcionales Docente/Admin o portal docente derivados de diseños históricos.

Las reglas vigentes que sustituyen estas decisiones se consultan en `user-stories-v2.xlsx`.

---

## 7. Restricciones de alcance transversal

No introducir durante la codificación sin una nueva decisión funcional aprobada:

- OAuth u otros proveedores externos de autenticación;
- portal o funcionalidades de Docente;
- tienda, monedas, canje o temporadas;
- desafíos creados por usuarios;
- feed social;
- publicaciones;
- comentarios;
- likes;
- chat social;
- seguidores;
- grupos;
- metrónomo;
- funciones adicionales inferidas únicamente a partir de layouts, prototipos o arquitectura prospectiva.

Una representación visual no justifica por sí misma crear entidades, endpoints, servicios o persistencia.

---

## 8. Deudas y artefactos auxiliares controlados

### 8.1 Sistema visual de cuerdas

El canon visual vigente del Afinador se consulta en `01_Design/mockups/3p-afinador.png` y en el artefacto de diseño vigente que lo sustituya en el futuro.

El Ejercicio Interactivo mantiene temporalmente una deuda visual controlada en la alineación de la 6.ª cuerda con ese canon. Esa deuda debe resolverse mediante un Task Contract específico y no autoriza a ampliar otro lote.

No convertir esta divergencia temporal en un segundo canon permanente.

### 8.2 Site Map

`mapa-navegacion-v2.png` es un artefacto auxiliar de navegación y no una fuente funcional canónica.

Cualquier contenido del Site Map que contradiga `user-stories-v2.xlsx` o esta baseline debe considerarse desactualizado hasta su sincronización documental.

### 8.3 Modelo de base de datos histórico

`GA4-220501095-AA1-EV02_Juan_Carlos_Carvajal_3336142_Modelo conceptual y lógico para la BDD del proyecto desarrollo de software.pdf` permanece como antecedente académico histórico.

Su modelo MySQL, tabla de roles y alcance parcial no deben reutilizarse como requerimiento vigente. El nuevo diseño de datos debe derivarse de `user-stories-v2.xlsx`, de esta baseline y de la arquitectura vigente.

---

## 9. Arquitectura y diseño técnico

Las fuentes técnicas vigentes son:

- `arquitectura-patrones-v1.pdf`;
- `diagrama-componentes_v1.png`;
- `diagrama-despliegue-v1.png`.

Esta baseline no reproduce tecnologías, patrones, componentes ni relaciones ya definidos en esas fuentes.

La arquitectura es prospectiva cuando el repositorio todavía no contiene los componentes descritos.

Antes de implementar un lote se debe verificar el repositorio real y distinguir:

- comportamiento funcional aprobado;
- arquitectura objetivo;
- implementación realmente existente.

El hecho de que una capacidad figure en arquitectura no autoriza su implementación fuera del Task Contract vigente.

---

## 10. Codificación controlada y documentación repo-native

Para cada cambio significativo:

1. verificar el repositorio y estado real;
2. identificar las HU afectadas en `user-stories-v2.xlsx`;
3. identificar cualquier regla transversal aplicable de esta baseline;
4. consultar arquitectura únicamente cuando el cambio tenga impacto técnico estructural;
5. ejecutar solo el Task Contract operativo vigente;
6. detenerse ante contradicciones, información faltante o necesidad de ampliar alcance;
7. validar criterios de aceptación y pruebas antes del handoff.

JuanC mantiene el control exclusivo del estado del repositorio.

Las reglas específicas de archivos autorizados, pruebas, seguridad, Git, stop conditions y handoff deben definirse en el Task Contract o plan técnico aprobado del lote correspondiente y no duplicarse aquí.

`README.md`, `CLAUDE.md`, `.github/copilot-instructions.md` y documentación equivalente deben referenciar las fuentes vigentes sin copiar su contenido completo.

Los guardrails deben mantenerse cortos, operacionales y orientados al trabajo de agentes.

---

## 11. Riesgos transversales prioritarios

Durante implementación debe vigilarse especialmente:

- utilizar documentación histórica como si fuera vigente;
- mezclar conceptos de dominio que las HU mantienen separados;
- convertir decisiones visuales en requisitos funcionales no aprobados;
- implementar arquitectura prospectiva sin verificar el repositorio;
- ampliar alcance a partir de inferencias;
- duplicar reglas canónicas en múltiples documentos y permitir que diverjan;
- mantener guardrails que apunten a una versión documental sustituida;
- diseñar persistencia a partir de pantallas en lugar de necesidades funcionales;
- reintroducir entidades históricas sin soporte en R01–R40.

Los riesgos específicos de cada lote pertenecen a su Task Contract.

---

## 12. Estado documental y vigencia

### Fuente funcional canónica

`user-stories-v2.xlsx`

Contiene R01–R40 vigentes y sustituye operativamente a V1.

### Fuente funcional/UX transversal

`MusicAI_Functional_Baseline_V3.2.md`

Sustituye operativamente a V3.1 una vez aprobada e integrada.

### Arquitectura

`arquitectura-patrones-v1.pdf`, `diagrama-componentes_v1.png` y `diagrama-despliegue-v1.png`, o sus sucesores formalmente aprobados.

### Task Contract

El Task Contract o plan técnico aprobado para el lote activo gobierna su alcance operativo. Esta baseline no prescribe una ruta o nombre de archivo fijo para dicho artefacto.

### Prototipo y diseño

Los mockups, Site Map y prototipo sirven como evidencia visual o de interacción dentro del alcance que les corresponda. No sustituyen las HU ni esta baseline.

### Versiones sustituidas

Las versiones anteriores de las HU y de la Functional Baseline dejan de ser fuentes operativas cuando sus sucesoras son aprobadas e integradas. Git conserva su trazabilidad histórica.

---

## 13. Condición de vigencia

El MVP continúa cerrado en R01–R40.

A partir de V3.2:

- `user-stories-v2.xlsx` es la única fuente funcional canónica de las HU;
- esta baseline no debe duplicar contenido detallado de las HU;
- toda nueva decisión funcional se registra primero en la HU afectada;
- esta baseline solo se actualiza si esa decisión produce impacto transversal, UX global, navegación, alcance, gobernanza, invariantes o revocaciones;
- el repositorio continúa siendo la verdad técnica del estado implementado;
- la arquitectura define dirección técnica, no estado implementado;
- el Task Contract vigente gobierna cada lote de trabajo;
- las versiones anteriores permanecen únicamente como historia documental.

**Estado final:** línea funcional R01–R40 cerrada, fuentes desacopladas por responsabilidad y documentación preparada para continuar la codificación de MusicAI sin mantener copias paralelas de los mismos requisitos.
