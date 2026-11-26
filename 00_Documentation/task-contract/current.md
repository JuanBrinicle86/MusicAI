# MusicAI — Task Contract

## Componente académico React — Home/Ruta

- **Estado:** ACTIVE — Sujeto a aprobación y activación por Juan Carlos.
- **Proyecto:** MusicAI
- **Evidencias:** GA7-220501096-AA3-EV01 / EV02
- **Fecha:** 24 de noviembre de 2026
- **Base técnica:** main @ 7aca136
- **Responsable:** ForgeFE
- **Autoridad final:** Juan Carlos Carvajal
- **Prioridad:** Cumplimiento académico y cronograma de entrega.

## 1. Objetivo

Implementar un componente React sencillo e interactivo dentro
del prototipo web existente de MusicAI, específicamente en
Home/Ruta, para satisfacer las evidencias académicas AA3-EV01
y AA3-EV02.

El componente deberá ejecutarse dentro de la interfaz existente
y estar disponible mediante la publicación del prototipo en Vercel.

Aplicar el principio KISS, evitando sobreingeniería, dependencias
innecesarias y actividades que no aporten al objetivo académico.

## 2. Fuentes y gobernanza

Consultar únicamente:

- AGENTS.md.
- 00_Documentation/roles/forge-fe.md.
- El presente Task Contract.
- Requisito R05 de user-stories-v2.xlsx.
- Secciones aplicables de la Functional Baseline V3.2.
- Implementación existente de Home/Ruta.

Las presentaciones del instructor correspondientes a las sesiones
46 y 47 prevalecen sobre la Guía de Aprendizaje 7 respecto
al alcance práctico y formato de entrega de las evidencias.

El desarrollo React es exclusivamente académico y no modifica
la arquitectura definitiva ni los requisitos de MusicAI.

## 3. Alcance funcional

Implementar el componente LessonAccordion para la lección
existente "Acordes con séptima" del nivel Intermedio.

Preservar:

- Estado inicialmente expandido.
- Expansión y contracción de la lección.
- Identificar acordes con séptima: completado.
- Construir progresión ii-V-I: actual.
- Ejecutar cadencia en guitarra: bloqueado.
- Evaluación interactiva: bloqueado.
- Enlaces existentes de los ejercicios habilitados.
- Ausencia de navegación en ejercicios bloqueados.
- Progreso académico demostrativo de 5/12 (42%).
- Identidad visual, accesibilidad y navegación existentes.

No introducir nuevas funcionalidades ni reglas de negocio.

## 4. Estrategia técnica

Integrar React incrementalmente dentro de home.html mediante
un punto de montaje independiente.

Tecnologías autorizadas al aprobar este contrato:

- Node.js y npm existentes.
- React.
- ReactDOM.
- JavaScript y JSX.
- esbuild como dependencia de desarrollo.
- CSS existente.

Aplicar únicamente los conceptos React que aporten valor:

- Componentes funcionales.
- JSX.
- Props.
- useState.
- Eventos.
- Renderizado condicional.
- map() para representar los ejercicios.
- createRoot() para montar el componente.

Conservar details y summary cuando permitan mantener
el comportamiento y los estilos existentes.

Instalar las dependencias npm en la raíz del repositorio.

Compilar el código JSX mediante esbuild y generar un archivo
JavaScript autónomo dentro de 02_Source/js/.

El prototipo publicado deberá funcionar sin CDN, servidor Node.js
activo ni instalación de dependencias por parte del usuario.

## 5. Inventario de archivos autorizados

### Crear

- package.json
- package-lock.json
- 02_Source/js/lesson-accordion.jsx
- 02_Source/js/lesson-accordion.bundle.js

### Modificar

- 02_Source/pages/home.html
- .gitignore, únicamente si es necesario ignorar node_modules/.

El archivo bundle.js será generado mediante el proceso de
compilación y deberá versionarse para permitir la publicación
estática del prototipo.

No versionar node_modules/.

Conservar los avisos de licencia de las dependencias incluidas
en el archivo compilado.

### Preservar sin modificaciones

- 02_Source/js/home.js
- 02_Source/css/home.css
- Restantes páginas, estilos y scripts del prototipo.
- 00_Documentation/requirements/
- 00_Documentation/architecture/
- 00_Documentation/roles/
- 01_Design/
- 03_App/
- 03_Scripts/
- 04_JavaWeb/
- AGENTS.md
- CLAUDE.md
- README.md
- .github/

Cualquier modificación adicional requiere autorización humana.

## 6. Exclusiones

No implementar:

- Backend Node.js.
- Nuevas APIs.
- Conexiones a bases de datos.
- Persistencia de estado.
- Autenticación.
- Cambios en reglas de desbloqueo.
- Migración completa del prototipo a React.
- Migración a Vite.
- TypeScript.
- Redux.
- Nuevos frameworks CSS.
- Infraestructura de pruebas automatizadas.

No modificar Flutter, Java Web, Tomcat, SQL Server ni Dev Tunnels.

Los pendientes históricos de otros lotes permanecen fuera
del alcance de este contrato.

## 7. Documentación del código

El código JSX deberá incluir comentarios explicativos en español,
conforme a las instrucciones del instructor.

Explicar cada línea o instrucción de forma clara, respetando
la sintaxis válida de JavaScript y JSX.

Mantener los identificadores técnicos en inglés y los textos
de la interfaz en español.

ForgeFE deberá entregar una explicación breve de los archivos
creados, modificados y del flujo de ejecución del componente.

No documentar manualmente el contenido del bundle generado.

## 8. Validación funcional básica

Comprobar:

- Compilación satisfactoria mediante esbuild.
- Carga correcta de Home/Ruta.
- Lección inicialmente expandida.
- Expansión y contracción mediante interacción.
- Conservación de los cuatro ejercicios y sus estados.
- Navegación existente de los ejercicios habilitados.
- Ausencia de navegación en ejercicios bloqueados.
- Conservación del progreso académico.
- Ausencia de errores JavaScript introducidos.
- Conservación visual y funcional básica de Home/Ruta.

No incorporar frameworks de pruebas ni realizar auditorías
extensas para esta evidencia.

Registrar únicamente resultados realmente comprobados.

## 9. Versionamiento y publicación

Juan Carlos conserva el control exclusivo sobre:

- Creación y cambio de ramas.
- Staging.
- Commits.
- Push.
- Merge.
- Publicación y configuración de Vercel.

ForgeFE podrá realizar consultas Git de solo lectura.

Publicar el componente integrado en el prototipo existente
mediante Vercel.

Verificar el funcionamiento desde el enlace público directo
a Home/Ruta, sin depender del backend Java Web.

No modificar la configuración de GitHub Pages ni de Vercel
sin autorización expresa.

## 10. Entregables académicos

### GA7-220501096-AA3-EV01

- Componente React funcional.
- PDF con código JSX comentado línea por línea.
- Evidencia visual de ejecución.

### GA7-220501096-AA3-EV02

- Código fuente publicado en GitHub.
- Video explicativo de máximo dos minutos.
- PDF con enlace al repositorio y al video.
- Enlace complementario al prototipo funcionando en Vercel.

Juan Carlos y ChatGPT elaborarán los documentos académicos
y el guion del video a partir del desarrollo comprobado.

## 11. Condiciones de finalización

El lote estará completo cuando:

- El componente React funcione dentro de Home/Ruta.
- Se hayan realizado las validaciones básicas.
- No existan modificaciones fuera del alcance autorizado.
- El código esté publicado en GitHub.
- El componente esté disponible en Vercel.
- Las dos evidencias estén preparadas.
- Juan Carlos apruebe el resultado final.

Ante una dificultad técnica, priorizar la alternativa más
sencilla que permita cumplir el objetivo académico sin
comprometer el funcionamiento existente.
