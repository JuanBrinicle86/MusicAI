# MusicAI

MusicAI es un proyecto de aprendizaje cuyo propósito es desarrollar una plataforma de educación musical aplicando principios de Ingeniería de Software Asistida por Inteligencia Artificial.

El proyecto busca formar criterios sólidos de ingeniería antes que acelerar el desarrollo mediante herramientas de IA.

## Objetivos

- Aprender Ingeniería de Software mediante un proyecto real.
- Aplicar buenas prácticas de arquitectura y desarrollo.
- Comprender cada decisión técnica antes de implementarla.
- Construir una plataforma profesional de aprendizaje musical.

## Tecnologías (Fase Inicial)

- HTML5
- CSS3
- JavaScript
- Git
- GitHub
- Visual Studio Code

Las tecnologías se incorporarán de forma incremental conforme el proyecto lo requiera.

## Estructura del repositorio

```text
MusicAI
│
├── 00_Documentation
├── 01_Design
├── 02_Source
├── 03_Scripts       # Reservada para tooling; vacía por ahora, por eso Git no la rastrea
└── README.md
```

## Cómo ejecutar el prototipo

- Abre la carpeta raíz `MusicAI/` en Visual Studio Code y sirve el proyecto con la extensión Live Server; `.vscode/settings.json` ya la configura para usar `02_Source/` como raíz (`liveServer.settings.root`).
- Abre el prototipo siempre por HTTP (Live Server o el despliegue público), nunca con doble clic sobre un archivo (`file://`): el Assistant Panel usa `fetch()` para cargar su partial y esa llamada falla bajo `file://`.
- Los dos `index.html` del repositorio solo redirigen, no contienen la aplicación en sí: el de la raíz redirige a `02_Source/pages/login.html`, y el de `02_Source/` redirige a `pages/login.html`.
- El despliegue público actual es en Vercel, sirviendo el proyecto desde la raíz del repositorio (ver configuración en `CLAUDE.md`).

## Filosofía del proyecto

- Comprensión antes que implementación.
- Arquitectura antes que código.
- Calidad antes que velocidad.
- Desarrollo incremental.
- Documentación como parte del producto.
- Inteligencia Artificial como herramienta de apoyo, no como sustituto del desarrollador.