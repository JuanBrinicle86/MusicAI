# MusicAI — Task Contract
## Flutter Login simulado + Home/Ruta — GA6-220501096-AA3-EV02

**Ruta operativa:** `00_Documentation/task-contract/current.md`  
**Estado:** ACTIVO — APROBADO POR JUAN CARLOS PARA EL LOTE  
**Proyecto:** MusicAI  
**Evidencia:** GA6-220501096-AA3-EV02 — Crear el diseño del sitio web y/o móviles  
**Commit base:** `main` @ `435627c8fe5d84743acb46f1d85ef3a0893c4e38`  
**Fecha de consolidación:** 23 de septiembre de 2026  
**Responsable funcional:** Atlas  
**Arquitecto oficial:** Daedalus  
**Revisión técnica del lote:** Daedalus — Home/Ruta; Codex — delta Login, validado por Atlas  
**Implementador previsto:** ForgeFE  
**Validador independiente:** Sentinel  
**Autoridad final:** Juan Carlos Carvajal  

---

## 1. Objetivo del lote

Implementar en Flutter/Dart, para Android, un recorrido demostrativo compuesto por:

1. **Login simulado**, como pantalla de entrada.
2. **Home/Ruta simulada**, como pantalla principal y objetivo central de la evidencia.

Recorrido autorizado:

`Login → Home/Ruta`

La evidencia responde a la indicación académica:

> “Desarrollar la pantalla principal del software en versión Android. Incluir el código desarrollado. No es el registro de usuarios.”

Por tanto:

- Home/Ruta es la pantalla principal objeto de la evidencia.
- Login se incluye únicamente como acceso demostrativo previo y coherente con la navegación vigente.
- No se implementa autenticación real.
- No se implementa Registro.
- No se implementa Recuperación de contraseña.
- No se implementan backend, persistencia, JWT ni servicios reales.

---

## 2. Fuentes aplicables

Jerarquía operativa:

1. Repositorio real + commit base.
2. `00_Documentation/requirements/user-stories-v2.xlsx`.
3. `00_Documentation/requirements/MusicAI_Functional_Baseline_V3.2.md`.
4. Arquitectura vigente:
   - `00_Documentation/architecture/arquitectura-patrones-v1.pdf`
   - `00_Documentation/architecture/diagrama-componentes_v1.png`
   - `00_Documentation/architecture/diagrama-despliegue-v1.png`
5. Este Task Contract.
6. Prototipo, mockups y artefactos históricos como apoyo.

Cuando el prototipo contradiga las HU o la Baseline, prevalecen las fuentes canónicas.

---

## 3. Requisitos/HU relacionados

### 3.1 Login

- **R02 — Inicio de sesión**, únicamente como referencia funcional parcial para:
  - correo electrónico;
  - contraseña;
  - contraseña oculta de forma predeterminada;
  - mostrar/ocultar contraseña;
  - validación local mínima;
  - navegación `Login → Home/Ruta`.

Este lote **NO declara R02 completamente implementada**, porque no existen:

- verificación real de credenciales;
- sesión autenticada real;
- backend;
- servicio de autenticación;
- JWT;
- manejo real de errores de conexión;
- persistencia.

R01 y R03 permanecen fuera de implementación.

### 3.2 Home/Ruta

Historias principales:

- R04 — Continuar el proceso de aprendizaje.
- R05 — Consultar y explorar la ruta de aprendizaje.
- R06 — Consultar el resumen del progreso académico.
- R07 — Navegar hacia los módulos principales.
- R08 — Acceder a las notificaciones.
- R09 — Consultar información contextual de Nivel o Lección mediante IA MusicAI.
- R12 — Consultar información contextual de un Ejercicio mediante IA MusicAI antes de su ejecución.

Estas HU se trazan al comportamiento demostrativo de Home/Ruta.

El lote no declara implementación completa de criterios que dependan de servicios, persistencia, contenido pedagógico inexistente o módulos fuera de alcance.

---

## 4. Alcance funcional — Login simulado

La aplicación debe iniciar en una pantalla Login Flutter.

Debe representar como mínimo:

- identidad visual MusicAI según el prototipo;
- campo `Correo electrónico`;
- campo `Contraseña`;
- contraseña oculta por defecto;
- control mostrar/ocultar contraseña;
- botón `Iniciar sesión`;
- `Regístrate ahora`, visible pero deshabilitado/no operativo;
- `¿Olvidaste tu contraseña?`, visible pero deshabilitado/no operativo.

### 4.1 Validación local autorizada

La simulación debe validar localmente:

- correo obligatorio;
- formato básico de correo válido;
- contraseña obligatoria.

Cuando los campos sean válidos:

- `Iniciar sesión` realiza **acceso simulado**;
- no consulta ningún servicio;
- no valida credenciales reales;
- no crea sesión real;
- navega a Home/Ruta.

La implementación y la evidencia deben dejar claro que es una simulación académica.

### 4.2 Funciones expresamente fuera de alcance del Login

No implementar de forma real:

- Registro de usuario;
- Recuperación de contraseña;
- Google/Apple/OAuth;
- autenticación remota;
- almacenamiento de credenciales;
- tokens;
- JWT;
- sesión persistente;
- gestión de usuario;
- errores de conexión simulados como si existiera backend.

`Regístrate ahora` y `¿Olvidaste tu contraseña?` permanecen visualmente presentes por fidelidad funcional, pero deben mostrarse claramente deshabilitados/no disponibles en esta evidencia y no deben producir navegación.

---

## 5. Alcance funcional — Home/Ruta

Home y Ruta constituyen una única experiencia.

Jerarquía canónica:

`Nivel → Lección → Ejercicio`

Nivel y Lección funcionan como agrupadores dentro de Home/Ruta y no como pantallas independientes.

La pantalla debe permitir visualizar, con datos locales simulados:

- nivel actual;
- lección activa;
- ejercicio actual/pendiente;
- ejercicios completados;
- ejercicios disponibles;
- ejercicios bloqueados;
- niveles y lecciones según su estado;
- progreso académico;
- expansión/contracción cuando aplique al contenido definido;
- accesos contextuales `Info`.

No se implementa lógica real de desbloqueo.

Los estados mostrados son predeterminados para la demostración.

---

## 6. Dataset demostrativo aprobado

Los datos de este lote son **locales, no persistentes y no canónicos como contenido pedagógico**.

Su propósito es permitir una demostración coherente de Home/Ruta sin convertir vacíos del prototipo en contenido académico oficial.

### 6.1 Niveles

- Básico — completado.
- Elemental — completado.
- Intermedio — actual.
- Avanzado — bloqueado.
- Experto — bloqueado.

### 6.2 Nivel Intermedio

Lecciones visibles:

1. `Cadencias funcionales` — completada.
2. `Acordes con séptima` — activa.
3. `Progresiones armónicas` — bloqueada.

Para fines exclusivamente demostrativos se autoriza:

- 4 ejercicios estructurales simulados en `Cadencias funcionales`, todos completados;
- los 4 ejercicios ya presentes en el prototipo para `Acordes con séptima`;
- 4 ejercicios estructurales simulados en `Progresiones armónicas`, todos bloqueados.

Ejercicios conocidos del prototipo en `Acordes con séptima`:

1. `Identificar acordes con séptima` — completado.
2. `Construir progresión ii-V-I` — actual.
3. `Ejecutar cadencia en guitarra` — bloqueado.
4. `Evaluación interactiva` — bloqueado.

Los ejercicios estructurales cuyo contenido nunca fue definido usan etiquetas neutrales tipo `Ejercicio 1`, `Ejercicio 2`, etc. No representan contenido pedagógico canónico.

### 6.3 Progreso académico demostrativo

En Intermedio:

- ejercicios completados: 5;
- ejercicios totales: 12;
- porcentaje calculado: `5 / 12 = 41,67 %`, mostrado como **42 %** mediante un único criterio de redondeo.

El porcentaje:

- se calcula desde ejercicios;
- no se almacena como dato independiente;
- no se deriva de XP;
- no utiliza el 65 % histórico del prototipo.

### 6.4 Limitación documental controlada

Las fuentes no definen el detalle pedagógico interno completo de los niveles Básico y Elemental.

Este lote no debe inventar temáticas académicas para llenar ese vacío.

Por ello, la representación de R05 es parcial respecto a la expansión interna de niveles completados cuyo contenido no esté definido. No se declarará cumplimiento completo de ese criterio en esta evidencia.

Si la implementación requiere crear contenido pedagógico nuevo para esos niveles, debe detenerse y volver a Atlas/Juan Carlos.

---

## 7. Progreso académico

Home/Ruta debe mostrar:

- nivel actual;
- porcentaje de avance académico;
- ejercicios completados / total.

Mantener estrictamente:

- progreso académico ≠ XP;
- progreso académico ≠ XP semanal;
- progreso académico ≠ racha;
- progreso académico ≠ logros;
- progreso académico ≠ desafíos;
- progreso académico ≠ recompensas.

No mostrar XP como medida del avance académico.

---

## 8. Interacciones propias de Home/Ruta

Deben funcionar localmente:

- expandir nivel cuando exista contenido autorizado para mostrar;
- contraer nivel;
- expandir lección cuando esté autorizada;
- contraer lección;
- identificar nivel actual;
- identificar lección activa;
- identificar ejercicio actual;
- impedir navegación de ejercicios bloqueados;
- conservar el estado de expansión mientras Home permanezca montada.

Expandir/contraer no modifica:

- progreso;
- desbloqueos;
- XP;
- dataset.

---

## 9. Shell autenticado representado

### 9.1 Header

Debe contener:

- Perfil;
- Notificaciones.

La implementación completa de ambos módulos queda fuera de alcance.

### 9.2 Bottom Navigation

Debe contener exactamente:

1. Home
2. Afinador
3. IA MusicAI
4. Desafíos
5. Comunidad

Reglas:

- `Home` es la etiqueta canónica.
- Home aparece activo.
- Ruta no aparece como destino independiente.
- Perfil no aparece en Bottom Navigation.

---

## 10. Límite de navegación y simulación

Se autoriza navegación mínima demostrativa.

### 10.1 Home

Es la pantalla principal autenticada simulada.

### 10.2 Destinos simulados

Pueden representarse mediante una única pantalla genérica claramente identificada como simulación:

- Afinador;
- Desafíos;
- Comunidad;
- Perfil;
- Notificaciones;
- Detalle del progreso;
- Ejercicio interactivo para ejercicios habilitados.

Los ejercicios bloqueados no navegan.

### 10.3 IA MusicAI

Debe representarse mediante una simulación contextual mínima.

No se presenta ninguna respuesta falsa de LLM.

---

## 11. Simulación de IA contextual

Accesos `Info`:

- Nivel completado o disponible.
- Lección completada o disponible.
- Ejercicio visible desde Home/Ruta, incluido un ejercicio bloqueado cuando su fila sea visible.

Consultar Info:

- no inicia ejercicio;
- no crea intento;
- no modifica progreso;
- no desbloquea;
- no otorga XP.

El modal simulado muestra:

- tipo de contexto;
- nombre del elemento;
- consulta generada automáticamente;
- indicación inequívoca de simulación.

Consultas demostrativas:

- Nivel: `Explícame el propósito del nivel "{nombre}" dentro de mi ruta de aprendizaje de MusicAI.`
- Lección: `Explícame los conceptos principales de la lección "{nombre}" antes de continuar.`
- Ejercicio: `Explícame el propósito, los conceptos o la técnica del ejercicio "{nombre}" antes de realizarlo.`

No generar una respuesta ficticia de IA.

---

## 12. Preservación del estado de Home/Ruta

Al abrir un destino simulado encima de Home/Ruta y regresar:

- nivel actual conserva su identificación;
- lección activa conserva su identificación;
- ejercicio actual conserva su identificación;
- niveles/lecciones que el usuario haya expandido o contraído mantienen su estado mientras Home permanezca montada.

La solución aprobada para los destinos de Home utiliza navegación `push/pop`, conservando el `State` de Home.

---

## 13. Referencia visual

Referencias autorizadas:

- prototipo histórico en `02_Source/`, solo lectura;
- árbol jerárquico de `learning-path.html`;
- header/apariencia aprovechable de `home.html`;
- Login histórico como referencia visual de la pantalla de acceso;
- `01_Design/mockups/2p-home-ruta.png`, solo como apoyo visual donde siga siendo vigente.

No convertir HTML/CSS/JS 1:1 a Flutter.

No portar decisiones históricas revocadas, incluyendo:

- saludo grande;
- quick actions;
- Recent Activity en Home;
- XP como progreso;
- tarjetas duplicadas;
- Ruta como pestaña/destino independiente;
- Nivel como pantalla;
- Lección como pantalla;
- bloque `¡Sigue así…!`;
- `Siguiente logro / 13:31`;
- OAuth/Google/Apple en Login.

---

## 14. Arquitectura aprobada

### 14.1 Ubicación

Nuevo proyecto Flutter:

`03_App/`

`03_App/pubspec.yaml` es la raíz del proyecto Flutter.

`02_Source/` permanece totalmente separado y protegido.

### 14.2 Creación inicial

Proyecto:

- Flutter;
- Android únicamente;
- nombre Dart: `musicai`;
- organización: `io.github.juanbrinicle86`;
- applicationId esperado: `io.github.juanbrinicle86.musicai`;
- plantilla mínima, si los flags reales de Flutter 3.47.4 lo soportan.

Antes de ejecutar `flutter create`, ForgeFE debe verificar `flutter create --help`.

### 14.3 Separación mínima

Mantener diseño pequeño:

- `main.dart`: `runApp`.
- `app.dart`: aplicación, tema y **composition root** del lote.
- `login/`: Login simulado autocontenido.
- `shell/`: componentes globales.
- `home_route/`: Home/Ruta, modelos y datos demostrativos.
- `simulation/`: destinos simulados e IA simulada.

No crear `core/`, `data/`, `domain/`, `services/`, `repositories/` ni capas anticipadas.

### 14.4 Patrón

MVC ligero:

- Modelo: modelos y datos demostrativos.
- Vista: widgets Flutter.
- Controlador: estado local de las pantallas.

No forzar:

- Singleton;
- Factory Method;
- Observer de dominio;
- Strategy;
- Facade;

porque sus casos de uso reales no forman parte del lote.

---

## 15. Arquitectura Home/Ruta

### 15.1 Modelos

- `LearningLevel`
- `Lesson`
- `Exercise`
- `enum RouteStatus { completed, active, available, locked }`

Reglas:

- modelos inmutables;
- porcentajes mediante getters;
- sin campos XP;
- sin backend;
- sin `Future` falso;
- sin clases `repository`, `service`, `api` o equivalentes ficticios.

### 15.2 Estado

`HomeRouteScreen` usa estado local mínimo con `setState`.

Mantiene una única fuente de verdad para expansión mediante Sets de ids.

No usar:

- Provider;
- Riverpod;
- BLoC;
- GetX;
- MobX;
- GetIt;
- `ChangeNotifier` innecesario.

### 15.3 Navegación interna de Home

- `Navigator.push`.
- `MaterialPageRoute`.
- `Navigator.pop`.

Sin router externo.

### 15.4 Shell

- `MusicAiHeader`.
- `MusicAiBottomNav`.

No crear un framework de shell anticipadamente.

### 15.5 Inyección de datos

`app.dart` conserva la responsabilidad de componer `HomeRouteScreen` con los datos demostrativos autorizados, incluyendo `demoRouteLevels` y el estado simulado de notificaciones cuando corresponda.

`LoginScreen` no debe conocer ni importar el dataset de Home/Ruta.

---

## 16. Arquitectura Login aprobada

### 16.1 Archivo

Login se implementa únicamente en:

`03_App/lib/login/login_screen.dart`

No crear:

- `auth_service.dart`;
- `auth_repository.dart`;
- `login_controller.dart`;
- modelos de usuario/credenciales/sesión;
- interfaces o abstracciones de autenticación.

### 16.2 Estado local

Utilizar:

- `Form`;
- `GlobalKey<FormState>`;
- dos `TextFormField`;
- validadores locales;
- un `bool` para mostrar/ocultar contraseña;
- `setState` únicamente para alternar dicha visibilidad;
- `FormState.validate()` para submit.

No se requieren `TextEditingController` para este alcance.

### 16.3 Composición y navegación Login → Home/Ruta

`app.dart` inicia la aplicación en `LoginScreen` y le proporciona un `WidgetBuilder` o mecanismo equivalente mínimo para construir el destino Home/Ruta.

Responsabilidades:

- `app.dart` compone `HomeRouteScreen` con `demoRouteLevels` y los datos demostrativos autorizados;
- `LoginScreen` valida únicamente el formulario local;
- `LoginScreen` no conoce ni importa `demo_route_data.dart`;
- tras validación correcta, `LoginScreen` usa `Navigator.pushReplacement` + `MaterialPageRoute` para reemplazar Login por el destino proporcionado por `app.dart`.

Después del acceso simulado:

- Login queda eliminado del back stack;
- Back desde Home/Ruta no regresa a Login;
- no se implementa logout en este lote.

### 16.4 Registro y Recuperación

`Regístrate ahora` y `¿Olvidaste tu contraseña?`:

- se muestran si forman parte de la composición visual elegida;
- permanecen deshabilitados/no operativos;
- no crean rutas;
- no abren modales funcionales;
- no implementan R01/R03;
- deben ser accesiblemente identificables como no disponibles en esta evidencia.

---

## 17. Estructura autorizada

```text
MusicAI/
├─ 00_Documentation/                  PROTEGIDO
├─ 01_Design/                         PROTEGIDO
├─ 02_Source/                         PROTEGIDO (prototipo)
├─ 03_App/                            NUEVO: proyecto Flutter
│  ├─ android/                        generado
│  ├─ lib/
│  │  ├─ main.dart
│  │  ├─ app.dart
│  │  ├─ login/
│  │  │  └─ login_screen.dart
│  │  ├─ shell/
│  │  │  ├─ musicai_header.dart
│  │  │  └─ musicai_bottom_nav.dart
│  │  ├─ home_route/
│  │  │  ├─ route_models.dart
│  │  │  ├─ demo_route_data.dart
│  │  │  ├─ home_route_screen.dart
│  │  │  ├─ progress_summary_card.dart
│  │  │  └─ route_tree.dart
│  │  └─ simulation/
│  │     ├─ simulated_destination_screen.dart
│  │     └─ assistant_simulation_sheet.dart
│  ├─ test/
│  │  ├─ route_models_test.dart
│  │  ├─ home_route_screen_test.dart
│  │  └─ login_screen_test.dart
│  ├─ pubspec.yaml
│  ├─ pubspec.lock
│  ├─ analysis_options.yaml
│  └─ archivos estándar generados
└─ resto del repositorio             PROTEGIDO
```

Resultado previsto: **12 archivos fuente dentro de `lib/` y 3 archivos de test**.

`route_tree.dart` agrupa nivel, lección y ejercicio; no convertir cada fila en una abstracción independiente.

---

## 18. Dependencias

### 18.1 Runtime

Cero paquetes externos.

Usar:

- Flutter SDK;
- `package:flutter/material.dart`;
- Dart core.

### 18.2 Desarrollo

- `flutter_test`;
- `flutter_lints` generado por Flutter.

Si la plantilla genera `cupertino_icons` y no existe uso, eliminarlo de `pubspec.yaml`.

### 18.3 No autorizados

- provider;
- riverpod;
- flutter_bloc;
- get;
- mobx;
- get_it;
- go_router;
- auto_route;
- http;
- dio;
- shared_preferences;
- hive;
- sqflite;
- drift;
- firebase_*;
- google_fonts;
- flutter_svg;
- freezed;
- json_serializable;
- build_runner;
- equatable;
- intl;
- mockito;
- mocktail;
- integration_test.

Cualquier dependencia adicional requiere STOP + aprobación.

---

## 19. Configuración Android

Mantener defaults resueltos por Flutter para:

- `flutter.minSdkVersion`;
- `flutter.compileSdkVersion`;
- `flutter.targetSdkVersion`.

No sobrescribir manualmente.

Único cambio Android previsto:

- `android:label="MusicAI"`.

Condiciones:

- registrar valores SDK resueltos;
- `compileSdk` y `targetSdk` no deben exigir una plataforma superior a la instalada;
- si Gradle intenta instalar automáticamente plataformas, NDK o build-tools no autorizados: STOP.

---

## 20. Archivos autorizados y protegidos

### 20.1 Generados por `flutter create`

ForgeFE puede generar dentro de `03_App/` todos los archivos estándar producidos por el comando autorizado y debe entregar el inventario exacto.

### 20.2 Generados que ForgeFE puede modificar

- `03_App/pubspec.yaml`
  - ajustar `description` si corresponde;
  - retirar `cupertino_icons` si fue generado y no se usa.
- `03_App/android/app/src/main/AndroidManifest.xml`
  - únicamente `android:label="MusicAI"`.
- `03_App/lib/main.dart`
  - reemplazo por bootstrap mínimo `runApp`.
- `03_App/lib/app.dart`
  - aplicación, tema, composición de Login y Home/Ruta.
- `03_App/test/widget_test.dart`
  - eliminar únicamente si la plantilla lo genera y queda sustituido por los tests autorizados.

### 20.3 Fuente MusicAI que ForgeFE puede crear

Exactamente:

- `03_App/lib/login/login_screen.dart`
- `03_App/lib/shell/musicai_header.dart`
- `03_App/lib/shell/musicai_bottom_nav.dart`
- `03_App/lib/home_route/route_models.dart`
- `03_App/lib/home_route/demo_route_data.dart`
- `03_App/lib/home_route/home_route_screen.dart`
- `03_App/lib/home_route/progress_summary_card.dart`
- `03_App/lib/home_route/route_tree.dart`
- `03_App/lib/simulation/simulated_destination_screen.dart`
- `03_App/lib/simulation/assistant_simulation_sheet.dart`

Además de `main.dart` y `app.dart`, el total autorizado dentro de `lib/` es de 12 archivos.

### 20.4 Tests que ForgeFE puede crear

Exactamente:

- `03_App/test/route_models_test.dart`
- `03_App/test/home_route_screen_test.dart`
- `03_App/test/login_screen_test.dart`

Cualquier archivo fuente o test adicional es STOP.

### 20.5 Generados por herramientas

Pueden existir, sin edición manual innecesaria:

- `pubspec.lock` — se versiona;
- `.dart_tool/`;
- `build/`;
- `android/local.properties`;
- `.idea/` **solo dentro de `03_App/`** cuando la herramienta lo genere.

`android/local.properties` debe permanecer ignorado.

### 20.6 Protegidos

Todo lo que está fuera de `03_App/`, incluyendo:

- `00_Documentation/**`;
- `01_Design/**`;
- `02_Source/**`;
- `AGENTS.md`;
- `CLAUDE.md`;
- `README.md` raíz;
- ambos `index.html` cuando existan;
- `.github/**`;
- `.vscode/**`;
- `.gitignore` raíz.

Dentro de `03_App/` permanecen protegidos frente a edición manual salvo autorización expresa anterior:

- `android/**`, excepto `android:label`;
- archivos Gradle y wrapper;
- `analysis_options.yaml`;
- `.metadata`;
- `.gitignore` generado;
- `README.md` generado.

No relajar reglas de análisis.

---

## 21. Criterios funcionales de aceptación

### Login

1. La aplicación inicia en Login.
2. Se muestran correo y contraseña.
3. La contraseña aparece oculta inicialmente.
4. Mostrar/ocultar no modifica su contenido.
5. Campos vacíos no permiten continuar.
6. Un correo con formato localmente inválido no permite continuar.
7. Datos válidos realizan acceso simulado a Home/Ruta.
8. Login queda fuera del back stack después del acceso simulado.
9. Back desde Home/Ruta no regresa a Login.
10. `Regístrate ahora` y `¿Olvidaste tu contraseña?` no producen navegación ni flujo funcional.
11. No existe autenticación real.
12. No existe persistencia de credenciales.
13. No se implementan Registro ni Recuperación reales.
14. No aparecen proveedores OAuth/Google/Apple.

### Home/Ruta

15. Home y Ruta se presentan como una sola experiencia.
16. La jerarquía visible corresponde a Nivel → Lección → Ejercicio en el contenido definido.
17. El nivel actual se identifica claramente.
18. La lección activa se identifica claramente.
19. El ejercicio actual se identifica claramente.
20. Se distinguen estados completado, activo, disponible y bloqueado.
21. Los ejercicios bloqueados no permiten acceso.
22. La expansión/contracción autorizada funciona sin modificar progreso.
23. No se inventa contenido pedagógico para completar niveles sin detalle en las fuentes.
24. El progreso se calcula académicamente.
25. Intermedio muestra 5/12 y 42 %.
26. No se usa XP como progreso académico.
27. Header contiene Perfil y Notificaciones.
28. Bottom Navigation contiene exactamente Home, Afinador, IA MusicAI, Desafíos y Comunidad.
29. Home aparece activo.
30. Ruta no aparece como destino independiente.
31. Info aparece únicamente donde corresponde.
32. Info no modifica progreso, desbloqueos ni XP.
33. El modal IA no presenta una respuesta LLM falsa.
34. Los destinos fuera de alcance se identifican como simulación.
35. Al regresar desde una simulación se conserva el estado de Home/Ruta.
36. No se modifica `02_Source/**`.
37. No se implementa funcionalidad real fuera del alcance aprobado.

---

## 22. Criterios técnicos de aceptación

- **TA-01:** proyecto dentro de `03_App/`, Android únicamente.
- **TA-02:** dependencias limitadas exactamente a las autorizadas.
- **TA-03:** estado de Home únicamente local, sin framework externo.
- **TA-04:** porcentajes/conteos calculados; modelos sin XP.
- **TA-05:** datos en archivo local explícitamente simulado.
- **TA-06:** una sola implementación de Header y Bottom Navigation.
- **TA-07:** navegación de destinos de Home mediante `push/pop`.
- **TA-08:** nada persiste y no se agregan permisos.
- **TA-09:** `flutter analyze` limpio, tests pasando y APK debug generado.
- **TA-10:** sin overflow visible en el viewport del AVD.
- **TA-11:** Android sin overrides manuales de SDK; solo `android:label` previsto.
- **TA-12:** namespace `io.github.juanbrinicle86`; applicationId esperado `io.github.juanbrinicle86.musicai`.
- **TA-13:** `LoginScreen` reside únicamente en `lib/login/login_screen.dart`; no existen capas ficticias de autenticación.
- **TA-14:** `app.dart` inicia la aplicación en `LoginScreen` y permanece como composition root del lote.
- **TA-15:** Login usa únicamente `Form`, `GlobalKey<FormState>`, `TextFormField`, validadores y `setState` para visibilidad de contraseña; sin state-management externo ni `TextEditingController` innecesarios.
- **TA-16:** la transición válida Login → Home/Ruta utiliza `Navigator.pushReplacement` + `MaterialPageRoute`; Login queda eliminado del back stack; `app.dart` conserva la responsabilidad de componer `HomeRouteScreen` con los datos demostrativos y proporciona a Login el builder/destino correspondiente.
- **TA-17:** `Regístrate ahora` y `¿Olvidaste tu contraseña?` permanecen deshabilitados/no operativos y no crean rutas ni flujos.
- **TA-18:** Login no introduce dependencias, permisos, persistencia, servicios, modelos, repositories ni modificaciones en `home_route/**`, `shell/**` o `simulation/**` por causa exclusiva del delta Login.

---

## 23. Pruebas autorizadas

### 23.1 `route_models_test.dart`

- U1. Cálculo del porcentaje por lección y por nivel, incluido total 0.
- U2. Coherencia del dataset:
  - lección completada ⇒ ejercicios definidos para esa lección completados;
  - lección o nivel bloqueado ⇒ contenido definido bloqueado;
  - exactamente un nivel, una lección y un ejercicio actuales dentro del dataset demostrativo;
  - no hay ejercicios disponibles después de uno bloqueado dentro de la secuencia definida.

### 23.2 `home_route_screen_test.dart`

- W1. Sin excepciones de overflow en el viewport equivalente al AVD.
- W2. Nivel actual y lección activa expandidos; ejercicio actual marcado.
- W3. Exactamente 5 destinos en orden; no aparecen `Ruta` ni `Perfil` en Bottom Navigation.
- W4. Expandir/contraer funciona en los elementos autorizados; lo bloqueado no se expande.
- W5. Ejercicio bloqueado no navega.
- W6. Ejercicio habilitado abre simulación y al volver conserva expansiones.
- W7. Info abre sheet contextual, no abre ejercicio y progreso no cambia.
- W8. `5 de 12` es coherente con `42 %` y XP no aparece como métrica de progreso académico.

### 23.3 `login_screen_test.dart`

- L1. Login aparece inicialmente.
- L2. Contraseña está oculta inicialmente.
- L3. Mostrar/Ocultar alterna `obscureText` sin modificar el contenido introducido.
- L4. Submit con campos vacíos muestra errores y no navega.
- L5. Correo con formato inválido no navega.
- L6. Correo válido + contraseña no vacía navegan a Home/Ruta.
- L7. No existen Google, Apple ni OAuth.
- L8. Después del acceso válido, Login ya no forma parte del back stack y Home no puede hacer pop para volver a Login.
- L9. `Regístrate ahora` y `¿Olvidaste tu contraseña?` permanecen no operativos/deshabilitados y no generan navegación.

No usar golden tests, `integration_test`, mockito ni mocktail en este lote.

---

## 24. Validación técnica

### 24.1 Precondición

Juan Carlos confirma mediante lectura Git:

```text
git status --short
```

El working tree debe estar limpio antes de crear `03_App/`.

### 24.2 Creación

Desde la raíz del repositorio:

```text
flutter --version
flutter create --help
flutter create --platforms=android --project-name musicai --org io.github.juanbrinicle86 --empty 03_App
```

Si los flags reales de Flutter 3.47.4 difieren, STOP antes de improvisar otro comando.

### 24.3 Validación dentro de `03_App/`

```text
flutter pub get
dart format --output=none --set-exit-if-changed lib test
flutter analyze
flutter test test/login_screen_test.dart
flutter test
flutter build apk --debug
flutter devices
flutter run -d <id-emulador>
```

Resultados exigidos:

- `flutter analyze` sin issues.
- Tests L1–L9, U1–U2 y W1–W8 pasan.
- APK debug generado.
- ForgeFE registra `minSdk`, `compileSdk` y `targetSdk` resueltos.

### 24.4 Checklist manual en AVD

Validar como mínimo:

- inicio en Login;
- obligatoriedad de campos;
- correo inválido;
- mostrar/ocultar contraseña;
- Registro/Recuperación visibles pero no operativos;
- acceso simulado válido → Home/Ruta;
- Back desde Home no regresa a Login;
- criterios funcionales de Home/Ruta;
- regreso desde simulaciones conserva expansión;
- ningún texto cortado ni overflow visible.

### 24.5 Cierre

Desde la raíz:

```text
git status --short
```

Solo debe aparecer contenido autorizado de `03_App/`.

Si aparece `.idea/` en la raíz del repositorio: STOP. Android Studio debe abrir `03_App/`, no la raíz.

---

## 25. Target de validación

Entorno ya disponible:

- Flutter 3.47.4 Stable.
- Dart 3.13.3.
- Android Studio Quail 4 | 2026.1.4.
- Android SDK API 36.
- Android 16.
- emulador 1080×2400.

Para trabajo en IDE:

- abrir `03_App/` como proyecto Flutter;
- no abrir la raíz del repositorio como proyecto Android Studio.

---

## 26. Evidencia SENA

La evidencia final debe permitir demostrar:

1. ejecución Android de MusicAI;
2. pantalla Login simulada;
3. transición Login → Home/Ruta;
4. Home/Ruta como pantalla principal;
5. jerarquía Nivel → Lección → Ejercicio en el contenido definido;
6. estados visuales;
7. progreso académico;
8. navegación/simulaciones autorizadas;
9. código Flutter/Dart desarrollado;
10. proyecto `03_App/` abierto en Android Studio;
11. ejecución en emulador.

No repetir evidencia de instalación/configuración de Android Studio.

---

## 27. Fuera de alcance

No implementar realmente:

- Registro;
- Recuperación de contraseña;
- autenticación;
- JWT;
- backend;
- FastAPI;
- APIs REST;
- SQL Server;
- persistencia;
- sincronización;
- progreso persistente;
- motor real de desbloqueo;
- Ejercicio Interactivo completo;
- Detalle del progreso completo;
- Perfil completo;
- Notificaciones completas;
- Afinador completo;
- IA MusicAI real;
- Desafíos completos;
- Comunidad completa;
- DSP;
- procesamiento de audio;
- OpenAI API;
- TensorFlow;
- PyTorch;
- Librosa;
- infraestructura Docker/Cloud.

---

## 28. Stop Conditions

ForgeFE debe detenerse si:

- una HU o Baseline contradice el contrato;
- el prototipo contradice una fuente canónica;
- se requiere backend, persistencia, IA real o DSP;
- se requiere una dependencia no autorizada;
- se necesita crear contenido pedagógico nuevo para llenar vacíos;
- se requiere modificar `02_Source/**`;
- se requiere modificar documentación canónica;
- aparece una decisión funcional no definida;
- aparece una decisión arquitectónica no cubierta;
- se necesita ampliar archivos autorizados;
- `flutter create` modifica algo fuera de `03_App/`;
- Gradle intenta descargar plataforma, NDK o build-tools no autorizados;
- `compileSdk` o `targetSdk` resuelto exige una plataforma superior a la instalada;
- aparece `.idea/` en la raíz;
- para pasar `analyze` o tests habría que usar `// ignore`, relajar `analysis_options.yaml` o debilitar pruebas;
- Login requiere crear services, repositories, controllers, modelos de usuario/credenciales/sesión, persistencia o infraestructura de autenticación;
- Registro o Recuperación requieren navegación o implementación real;
- el delta Login obliga a modificar `home_route/**`, `shell/**` o `simulation/**`;
- Login requiere una dependencia runtime adicional;
- la solución deja Login accesible mediante Back después de un acceso válido;
- la fidelidad visual exige un asset o archivo adicional no autorizado;
- se requiere una operación Git que cambie estado.

Escalamiento:

- duda funcional → Atlas;
- decisión arquitectónica → Daedalus o revisor técnico sustituto expresamente autorizado por Juan Carlos;
- ampliación de alcance → STOP + Juan Carlos.

---

## 29. Completion Conditions

El lote queda listo para handoff a Sentinel únicamente cuando:

- la aplicación inicia efectivamente en Login;
- la validación local impide continuar con campos vacíos o correo inválido;
- mostrar/ocultar preserva el contenido de contraseña;
- datos localmente válidos llevan a Home/Ruta mediante reemplazo de ruta;
- Back desde Home/Ruta no regresa a Login;
- Registro y Recuperación no tienen flujo implementado;
- `login_screen_test.dart` pasa completamente;
- Home/Ruta funciona según contrato;
- todos los criterios de aceptación aplicables están verificados;
- `flutter analyze` está limpio;
- todos los tests pasan;
- APK debug se genera;
- ejecución correcta en AVD;
- no hay overflow visible;
- no hay scope creep;
- no existe backend, persistencia ni IA real;
- dependencias coinciden con el contrato;
- no existen archivos adicionales de autenticación fuera del inventario autorizado;
- archivos modificados/creados coinciden exactamente con el inventario autorizado;
- ForgeFE entrega inventario de archivos generados/modificados;
- ForgeFE registra SDK resueltos;
- ForgeFE entrega resultados de validación;
- `git status --short` queda limitado a `03_App/`;
- no se ejecutó ninguna operación Git que cambie estado.

La implementación no se considera integrada hasta revisión independiente de Sentinel y aprobación de Juan Carlos.

---

## 30. Gobierno de ejecución

Este `current.md` autoriza **el alcance del lote**, pero no autoriza por sí solo operaciones Git ni ampliaciones de alcance.

Flujo obligatorio:

1. El arquitecto/revisor técnico autorizado prepara el prompt técnico de implementación para ForgeFE utilizando este contrato como fuente operativa.
2. Atlas revisa ese prompt para confirmar fidelidad funcional y ausencia de scope creep.
3. Juan Carlos autoriza la ejecución.
4. ForgeFE implementa exclusivamente dentro del inventario autorizado.
5. Sentinel valida independientemente.
6. Juan Carlos decide integración, commit y push.

Juan Carlos mantiene control exclusivo sobre cualquier operación Git que cambie estado.
