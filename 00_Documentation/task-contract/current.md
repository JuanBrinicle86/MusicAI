# MusicAI — Task Contract

## Módulo académico Java Web: Bienvenida, Registro e Ingreso — GA7-220501096-AA2-EV01 / EV02

**Ruta operativa:** `00_Documentation/task-contract/current.md`\
**Estado:** ACTIVE — Aprobado y autorizado para implementación por Juan Carlos Carvajal.\
**Proyecto:** MusicAI\
**Evidencias:** GA7-220501096-AA2-EV01 y GA7-220501096-AA2-EV02\
**Fecha de consolidación:** 17 de noviembre de 2026 (Colombia)\
**Base técnica:** `main @ 85f6ff717c2bb2ae23ac8a9ca09760f766990c25`\
**Responsable de implementación:** ForgeBE\
**Arquitectura:** Daedalus\
**Validación independiente:** Sentinel\
**Autoridad humana final, DBA y administrador del entorno:** Juan Carlos Carvajal

---

## 1. Objetivo del lote

Implementar una única aplicación web académica funcional para las dos evidencias GA7, integrando el prototipo existente de MusicAI con Java 21, JSP, Servlets, JDBC y SQL Server. El usuario podrá registrarse realmente, ingresar mediante una simulación académica que verifica la existencia de su correo en la base de datos y navegar hacia Home/Ruta.

La misma implementación servirá para ambas evidencias; su presentación documental se ajustará a cada actividad académica: EV01 — Codificación de módulos del software según requerimientos del proyecto (desempeño); EV02 — Módulos de software codificados y probados (producto). La aceptación final requiere demostrar funcionamiento local y acceso remoto controlado para el instructor.

## 2. Fuentes aplicables y gobernanza

- `AGENTS.md` y `00_Documentation/roles/forge-be.md` regulan la actuación de ForgeBE. Para desviaciones arquitectónicas, consultar el rol Daedalus; para revisión independiente, el rol Sentinel.
- El repositorio real en el commit base define el estado técnico inicial. Leer únicamente los archivos necesarios bajo divulgación progresiva.
- Las decisiones funcionales y arquitectónicas de este lote fueron aprobadas por Juan Carlos tras los dictámenes de Daedalus. Este contrato consolida su alcance operativo.
- Por autorización expresa de Juan Carlos, el módulo Java Web académico es independiente de R01–R40, la Functional Baseline V3.2 y la aplicación definitiva. No es una implementación de sus requisitos ni modifica su semántica. Las diferencias deliberadas (registro sin contraseña, ingreso simulado y tecnología académica) no constituyen cambios de las HU.
- Las HU, Baseline, arquitectura definitiva y `03_App/` permanecen protegidas. La eventual publicación de Flutter Web en Vercel o equivalente y el backend definitivo desacoplado pertenecen a otro lote.
- El contrato anterior Home/Ruta está cerrado. Este contrato solo adquiere efecto cuando Juan Carlos lo publique y autorice la ejecución. No existe autorización implícita para otras tareas.

## 3. Base Git y precondiciones

Base comprobada por Juan Carlos: rama `main`, push exitoso de `5c15f07` a `85f6ff7`, árbol limpio y sincronizado con `origin/main`; incorporación de ForgeBE a la gobernanza consolidada.

Antes de editar, ForgeBE debe verificar mediante consultas de solo lectura la base, el estado del árbol, el contenido del contrato activo y las instrucciones del rol. Si Juan Carlos publica el contrato en un commit posterior, usar como referencia la base técnica anterior y el commit de activación expresamente comunicado por él. La modificación o publicación de `current.md` por Juan Carlos es esperada; no debe confundirse con un cambio de implementación. Cualquier otra divergencia material requiere detenerse. Comprobar en el repositorio local que `AGENTS.md` reconoce ForgeBE y que su definición vigente está versionada. La verificación del esquema y del procedimiento se fundamentará en la evidencia administrativa ya obtenida y, si hace falta confirmación adicional, en consultas de solo lectura ejecutadas por Juan Carlos; no solicitar privilegios adicionales ni exigir a ForgeBE acceso administrativo directo. Los originales SQL pendientes no invalidan por sí mismos esa evidencia.

ForgeBE no ejecutará `git add`, `commit`, `push`, `pull`, `merge`, `reset`, cambios de rama ni otras operaciones Git que alteren estado. Juan Carlos conserva el control exclusivo de Git y de la autorización final. Antes de hacer push de cambios que afecten `02_Source/`, Juan Carlos verificará si las publicaciones estáticas existentes se actualizan automáticamente desde la rama afectada (Vercel o GitHub Pages). Si fuera así, debe preservar la publicación existente mediante una decisión expresa sobre su configuración o estrategia de publicación antes del push de implementación. Este control no bloquea la implementación, compilación ni pruebas locales y no autoriza cambios de configuración por ForgeBE.

## 4. Alcance autorizado y exclusiones

Incluye bienvenida, registro real, ingreso académico, navegación a Home/Ruta, integración visual localizada, build WAR, pruebas sin dependencias adicionales, documentación técnica del módulo y referencias SQL históricas. El despliegue y las pruebas externas son responsabilidad de Juan Carlos.

No incluye autenticación real, hashing, almacenamiento de contraseñas, JWT, recuperación de contraseña, roles, autorización de recursos, sesiones autenticadas, CRUD adicional, modificaciones a Home/Ruta ni a las demás funcionalidades del prototipo, cambios a la aplicación Flutter, cambios de esquema adicionales, nuevas librerías o frameworks, Maven, cambios en publicaciones existentes ni exposición pública anónima.

## 5. Bienvenida e integración del prototipo

Conservar la identidad visual existente y las rutas de entrada. Transformar `02_Source/pages/login.html` en la bienvenida, con estos textos exactos:

- `MusicAI`
- `¡Bienvenido a MusicAI!`
- `¡Toma la guitarra y aprende armonía practicando!`

Presentar dos opciones: **Ingresar** y **Registrarse**, sin campos de autenticación en la bienvenida. Las opciones conducen respectivamente a `/pages/ingresar` y `/pages/registrar` dentro del contexto de la aplicación. En el HTML estático de bienvenida usar enlaces relativos a su directorio (`ingresar` y `registrar`), sin perder el prefijo `/musicai`; en las JSP construir las rutas de recursos, acciones y enlaces desde el contexto confiable de la aplicación. Reutilizar `login.css` para los estados visuales necesarios. Eliminar la comparación y credenciales de prueba codificadas en `login.js`, conservando únicamente interacciones visuales pertinentes. No eliminar el archivo.

No modificar los índices existentes ni Home/Ruta. Mantener sus rutas relativas y dependencias. No crear páginas estáticas de respaldo, formularios ficticios ni mensajes de indisponibilidad específicos de Live Server. El runtime funcional de este lote es Tomcat; conservar sin modificaciones las publicaciones estáticas existentes.

## 6. Registro — datos y validación

El formulario solicita exclusivamente estos seis campos obligatorios, en el orden indicado:

| Etiqueta               | Columna        | Máximo físico NVARCHAR |
| ---------------------- | -------------- | ---------------------: |
| Documento de identidad | DocumentNumber |                     30 |
| Nombres                | FirstName      |                    100 |
| Apellidos              | LastName       |                    100 |
| Correo electrónico     | Email          |                    254 |
| Teléfono de contacto   | PhoneNumber    |                     30 |
| Nombre para mostrar    | DisplayName    |                     80 |

Validar siempre en servidor; la validación del navegador es complementaria. Recortar espacios externos, rechazar vacíos y entradas compuestas únicamente por espacios, y comprobar longitudes antes de persistir. Las longitudes NVARCHAR se respetan en unidades UTF-16; no declarar soportados caracteres suplementarios que no se hayan verificado con la intercalación real. No truncar valores para forzar aceptación.

| Campo                | Regla aprobada                                                                                                                                                                                                                                                                                                        |
| -------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| DocumentNumber       | 1–30 letras ASCII o dígitos; sin espacios ni separadores internos; conservar mayúsculas, minúsculas y ceros iniciales. Se permite repetir documento.                                                                                                                                                                  |
| FirstName / LastName | Letras Unicode y marcas combinantes; tildes, ñ, espacios internos, guiones y apóstrofos rectos o tipográficos; al menos una letra; sin números ni caracteres de control; máximo 100 por campo.                                                                                                                        |
| Email                | ASCII, un único `@`, parte local de 1–64, segmentos locales no vacíos separados por puntos, aceptar `+`, dominio con al menos dos etiquetas y guiones interiores válidos, sufijo de al menos dos letras; sin espacios internos; máximo total 254. Conservar capitalización. Sin DNS, SMTP ni confirmación por correo. |
| PhoneNumber          | 7–15 dígitos ASCII, `+` inicial opcional, un espacio o guion simple entre grupos de dígitos; máximo total 30; conservar formato válido introducido; sin unicidad.                                                                                                                                                     |
| DisplayName          | Texto Unicode visible compatible con la intercalación física, incluyendo letras, números, espacios internos y puntuación; sin controles ni saltos de línea; máximo 80; sin unicidad.                                                                                                                                  |

Solo Email es único. Conservar `UQ_Student_Email` y la comparación de la base con intercalación `Modern_Spanish_CI_AS`, que no distingue mayúsculas de minúsculas. No realizar SELECT previo al INSERT.

## 7. Registro — flujo, persistencia y éxito

`RegistrationServlet` atiende GET y POST para `/pages/registrar`. Valida, construye `StudentRegistration` y solicita la escritura a `StudentDao`. La JSP de registro permanece bajo `WEB-INF/views/register.jsp`, sin lógica de negocio ni persistencia.

El INSERT es parametrizado, de seis columnas y sin recuperación de claves generadas:

```sql
INSERT INTO [musicai].[Student] (
    [DocumentNumber], [FirstName], [LastName],
    [Email], [PhoneNumber], [DisplayName]
)
VALUES (?, ?, ?, ?, ?, ?);
```

No utilizar `OUTPUT INSERTED`, no enviar `PasswordHash`, `AvatarUrl` ni columnas de estado o auditoría. La identidad, nulabilidad y valores predeterminados resuelven las columnas técnicas. Emitir la confirmación solo si `executeUpdate()` devuelve exactamente una fila afectada y la escritura está confirmada (autocommit efectivo o commit exitoso si se gestiona una transacción explícita). Utilizar parámetros Unicode compatibles con NVARCHAR, sin conversiones de pérdida de datos.

Aplicar Post-Redirect-Get (PRG): después del INSERT exitoso, guardar en sesión HTTP una confirmación temporal sin datos personales del formulario y responder `303` a `/pages/registro-confirmado`. El GET extrae y elimina la confirmación como una sola operación segura ante solicitudes concurrentes de la misma sesión. En Jakarta Servlet 6.0, emitir el 303 explícitamente mediante `SC_SEE_OTHER` y una cabecera `Location` de ruta absoluta respecto al origen, con el contexto de la aplicación (sin esquema ni host); no usar el `sendRedirect(String)` ordinario, que responde 302. Aplicar la misma regla al 303 del ingreso exitoso. El acceso directo o la recarga sin confirmación devuelve al formulario. No admitir una confirmación basada únicamente en un parámetro de URL.

Mostrar en `registration-success.jsp`:

- `¡Registro exitoso!`
- `Redirigiendo...`
- Barra de progreso animada de tres segundos, sin botones adicionales.

`registration-success.js` ejecuta `window.location.replace()` al concluir los tres segundos, hacia `pages/home.html` del contexto de la aplicación (`/musicai/pages/home.html` en el despliegue actual). Utilizar un destino fijo, del mismo origen, construido desde el contexto confiable. La sesión temporal no representa una identidad autenticada. Recargar no debe reiniciar una inserción ni una confirmación consumida.

## 8. Mensajes de registro y UX

| Evento                    | Texto exacto                                                        |
| ------------------------- | ------------------------------------------------------------------- |
| Registro exitoso          | ¡Registro exitoso!                                                  |
| Redirección               | Redirigiendo...                                                     |
| Correo duplicado          | Este correo electrónico ya está registrado.                         |
| Campo obligatorio         | Este campo es obligatorio.                                          |
| Documento inválido        | Ingresa un documento de identidad válido.                           |
| Nombre inválido           | Ingresa un nombre válido.                                           |
| Apellido inválido         | Ingresa un apellido válido.                                         |
| Correo inválido           | Ingresa un correo electrónico válido.                               |
| Teléfono inválido         | Ingresa un número de teléfono válido.                               |
| DisplayName inválido      | Ingresa un nombre para mostrar válido.                              |
| Error general de registro | No fue posible completar el registro. Inténtalo de nuevo más tarde. |

Mostrar errores debajo del campo correspondiente, resaltar en rojo los campos afectados y conservar las entradas de registro cuando haya error, escapadas según su contexto. Mostrar fallos generales en una notificación visible sin detalles internos. Mantener el estilo existente.

## 9. Ingreso académico — flujo y contraseña

`LoginServlet` atiende GET y POST de `/pages/ingresar` y presenta `WEB-INF/views/login.jsp`. La interfaz solicita correo y contraseña. El correo se valida con la misma regla de formato del registro, tanto en cliente como en servidor.

El campo de contraseña es obligatorio **solo en la interfaz**, mediante `required` y sin atributo `name`. Cualquier valor no vacío permite el envío normal. No comparar credenciales ni transmitir, almacenar, registrar, devolver o incluir su valor en parámetros, cabeceras, sesión, URL o cuerpo de solicitud. El formulario envía únicamente el correo y los metadatos técnicos necesarios. No crear una marca de cliente para simular una comprobación de seguridad del backend. No repoblar la contraseña en respuestas de error.

Mostrar aviso visible: `Ingreso académico simulado. Usa un dato ficticio y evita tus contraseñas reales` (texto de la propuesta de Daedalus aprobada en su tratamiento de contraseña).

El servidor comprueba existencia mediante `StudentDao` y el procedimiento autorizado. Correo existente (también con capitalización diferente): responder `303` hacia Home/Ruta. Correo inexistente: conservar el correo escapado, rechazar el ingreso y mostrar:

- `Este correo electrónico aún no está registrado.`
- `¡Regístrate y comienza a aprender armonía con MusicAI!`
- Enlace funcional `Regístrate ahora` al registro real.

Correo vacío o inválido: usar los mensajes de obligatoriedad o formato aprobados. Un fallo técnico de la BD no equivale a un correo inexistente; mostrar error general comprensible, sin revelar detalles técnicos. Usar un mensaje general de fallo de ingreso, sin alterar los mensajes de validación ni de correo inexistente. Texto propuesto en esta revisión para aprobación junto con el contrato: `No fue posible completar el ingreso. Inténtalo de nuevo más tarde.` No introducir otras frases de negocio sin autorización.

No asignar identidades, sesiones autenticadas ni tokens. El correo registrado verifica existencia, no identidad. Una solicitud directa puede omitir el campo simulado porque el servidor no recibe la contraseña. Home/Ruta conserva el acceso directo mediante URL. Documentar estas limitaciones; la protección remota no depende de este ingreso.

## 10. Arquitectura Java y persistencia

Paquete autorizado: `musicai.registration`. Seis clases, sin capas adicionales:

- `RegistrationServlet`: ciclo HTTP de registro y confirmación PRG.
- `LoginServlet`: ciclo HTTP de ingreso y navegación.
- `StudentRegistration`: representación de los seis datos validados.
- `RegistrationValidator`: reglas de registro y validación reutilizable del correo.
- `StudentDao`: INSERT parametrizado y consulta de existencia mediante CallableStatement.
- `HtmlEscaper`: escape de los valores según contexto de texto o atributo HTML.

Obtener el `DataSource` del contenedor vía `java:comp/env/jdbc/MusicAI`. Reutilizar el recurso sin compartir conexiones o statements mutables entre solicitudes. Usar `PreparedStatement` para INSERT y `CallableStatement` para el procedimiento, con parámetros y try-with-resources. No usar SQL dinámico ni conexiones con credenciales o URLs incrustadas. JSP con Expression Language y valores previamente escapados para su contexto; sin scriptlets ni JSTL ni nuevas dependencias. JavaScript externo para el comportamiento dinámico; no interpolar datos personales en código JavaScript.

Procedimiento existente: `musicai.usp_StudentExistsByEmail`, entrada `@Email NVARCHAR(254)`, salida un único resultado `StudentExists` de tipo BIT. Una llamada equivalente a `{call musicai.usp_StudentExistsByEmail(?)}` debe consumir la respuesta comprobando que no sea ausente, nula o inesperada. En tales casos, tratar como fallo técnico, nunca como inexistencia.

Duplicados: interpretar los errores SQL Server 2627/2601 únicamente si el diagnóstico identifica realmente `UQ_Student_Email` como restricción o índice de la colisión, considerando el objeto y la localización del mensaje. No buscar el nombre indiscriminadamente en el texto (el valor duplicado puede contenerlo). Si no puede atribuirse con certeza, manejar como fallo general. No registrar diagnósticos crudos ni PII.

## 11. Infraestructura física — ya implementada

Java Eclipse Temurin OpenJDK 21.0.13 x64; Apache Tomcat 10.1.61 (Jakarta Servlet 6.0 y JSP 3.1), servicio Windows `Tomcat10`, cuenta LocalService, SID específico `NT SERVICE\Tomcat10` habilitado; SQL Server 2025 versión 17.0.1000.7, base `MusicAI`, esquema `musicai`. Driver Microsoft JDBC 13.6.0 y DLL nativa x64 instalados externamente.

SQL Server escucha en loopback IPv4/IPv6, TCP 1433; DAC local 1434. Tomcat escucha `127.0.0.1:8080`. El Host utiliza `unpackWARs=false`, `autoDeploy=false`, `deployOnStartup=true`. JNDI externo asociado al contexto `/musicai`, nombre `jdbc/MusicAI`, tipo `javax.sql.DataSource`, pool DBCP2, autenticación integrada Windows/NTLM y `encrypt=strict` con certificado público PEM fijado. No deshabilitar validación TLS ni añadir contraseñas. No modificar estos recursos desde ForgeBE.

Estado de la tabla `musicai.Student` después de la migración aplicada:

| Columna        | Tipo          | Nulabilidad / comportamiento       |
| -------------- | ------------- | ---------------------------------- |
| StudentId      | INT           | NOT NULL, IDENTITY, PK             |
| DisplayName    | NVARCHAR(80)  | NOT NULL                           |
| Email          | NVARCHAR(254) | NOT NULL, UNIQUE                   |
| PasswordHash   | NVARCHAR(255) | NULL                               |
| AvatarUrl      | NVARCHAR(500) | NULL                               |
| IsActive       | BIT           | NOT NULL, DEFAULT 1                |
| CreatedAtUtc   | DATETIME2(7)  | NOT NULL, DEFAULT SYSUTCDATETIME() |
| UpdatedAtUtc   | DATETIME2(7)  | NOT NULL, DEFAULT SYSUTCDATETIME() |
| DocumentNumber | NVARCHAR(30)  | NOT NULL                           |
| FirstName      | NVARCHAR(100) | NOT NULL                           |
| LastName       | NVARCHAR(100) | NOT NULL                           |
| PhoneNumber    | NVARCHAR(30)  | NOT NULL                           |

`TimeZoneIana` eliminado; se conservaron 13 FK entrantes y las seis restricciones CHECK quedaron habilitadas y confiables. Las restricciones de texto no vacío de DisplayName, DocumentNumber, FirstName, LastName y PhoneNumber comprueban `LEN(LTRIM(RTRIM([Columna]))) > 0`; la restricción `CK_Student_EmailShape` utiliza `Email LIKE N'_%@_%.__%'`. Mantener la validación de aplicación compatible con ellas sin modificar las restricciones físicas. Tras la migración se verificaron cero filas; el estado de los datos deberá comprobarse al probar, no inferirse indefinidamente.

La definición lógica vigente del procedimiento utiliza SQL estático: `SELECT CAST(CASE WHEN EXISTS (SELECT 1 FROM musicai.Student WHERE Email = @Email) THEN 1 ELSE 0 END AS BIT) AS StudentExists;`. Tabla y procedimiento tienen propietario efectivo `dbo`. El procedimiento y el GRANT EXECUTE ya fueron creados y corregidos (separación de lotes con `GO`). Esto es una referencia de diseño, no un script histórico ni una autorización para ejecutar DDL/DCL.

Permisos del principal de servicio:

| Permiso                                | Alcance                            |
| -------------------------------------- | ---------------------------------- |
| CONNECT                                | MusicAI                            |
| INSERT                                 | musicai.Student                    |
| EXECUTE                                | musicai.usp_StudentExistsByEmail   |
| SELECT, UPDATE, DELETE, ALTER, CONTROL | Sin conceder sobre musicai.Student |

La cadena de propiedad habilita la consulta booleana sin SELECT directo. La prueba de JDBC anterior desde el servicio real devolvió HTTP 200, conexión exitosa, SID de servicio presente, NTLM, TCP, INSERT efectivo, cero para los otros permisos evaluados, sin sysadmin ni db_owner. Las DMV confirmaron cifrado y TDS 8.0; no se determinó la versión TLS negociada. Posteriormente, la prueba `EXECUTE AS USER` en SSMS confirmó INSERT, EXECUTE, ausencia de SELECT directo y `StudentExists=0`; `REVERT` restauró dbo. La prueba de suplantación no sustituye el token real de Tomcat después de la ampliación. El WAR temporal se retiró, JNDI se conservó y Tomcat quedó detenido.

Pendientes: primer INSERT real, duplicados, concurrencia, ejecución CallableStatement desde el servicio, resultado positivo y negativo del procedimiento, validación del token real tras el GRANT, indisponibilidad, despliegue definitivo y pruebas negativas TLS controladas. No declararlas superadas antes de ejecutarlas.

## 12. Seguridad de aplicación

- UTF-8 en solicitudes y respuestas dinámicas, JSP con codificación explícita.
- Escape contextual HTML para todos los valores no confiables que se rendericen. Evitar scriptlets, HTML crudo, sinks innecesarios y datos interpolados en scripts.
- Token CSRF para POST de registro, sin datos personales en sesión. No depender solo de loopback o SameSite; comprobar token servidor. Aplicar controles proporcionales al ingreso y no presentarlos como autenticación.
- Aceptar métodos y formatos de formulario esperados; limitar cuerpo antes de procesar parámetros, mediante controles del contenedor o aplicación según el diseño autorizado. Rechazar solicitudes cuyo análisis de parámetros falle o quede incompleto por límites o errores, incluidas las que no anuncien una longitud de cuerpo fiable; no basar el control únicamente en `Content-Length`. Se puede utilizar el filtro de análisis de peticiones provisto por Tomcat y configurado en el `web.xml` autorizado si resulta adecuado; no añadir clases, JAR ni archivos fuera del inventario. Si se requiere configuración externa, escalar a Juan Carlos; no cambiarla por cuenta propia.
- En vistas dinámicas con datos o confirmación: `Cache-Control: no-store`, `Referrer-Policy: no-referrer`, `X-Content-Type-Options: nosniff` y política que impida incrustación en marcos. No exponer trazas o versiones mediante respuestas propias.
- Seguimiento de sesión exclusivamente por cookie, sin identificador en URL. HttpOnly, SameSite=Lax y Path limitado al contexto; en acceso remoto HTTPS exigir además Secure y verificar los atributos efectivos en navegador. La fase local HTTP debe permitir probar CSRF y PRG; los ajustes de cookies dependientes del túnel se resuelven antes de publicación remota, sin debilitar sus requisitos. Las decisiones de configuración necesarias para compatibilidad con HTTP local y HTTPS remoto deben validarse sin confiar en cabeceras reenviadas arbitrarias ni desactivar controles remotos. Cualquier cambio externo requiere autorización de Juan Carlos.
- No loguear contraseñas, correos, otros datos personales, parámetros del formulario ni mensajes SQL crudos. Registrar únicamente información técnica depurada; distinguir conectividad, validación y duplicidad.
- Utilizar datos ficticios. Enumeración por correo y acceso directo a Home son riesgos conocidos del ingreso simulado. La exposición anónima queda prohibida. No trasladar el mecanismo a producción.

## 13. Inventario exacto de archivos autorizados

### Modificar (4)

| Ruta                         | Cambio autorizado                                                                              |
| ---------------------------- | ---------------------------------------------------------------------------------------------- |
| `.gitignore`                 | Agregar únicamente `04_JavaWeb/build/`.                                                        |
| `02_Source/pages/login.html` | Bienvenida y navegación.                                                                       |
| `02_Source/css/login.css`    | Estilos localizados de bienvenida, formularios, errores y progreso, sin regresiones.           |
| `02_Source/js/login.js`      | Retirar credenciales codificadas y comparación local; conservar interacción visual pertinente. |

### Crear (18)

| Ruta                                                             | Finalidad                                                         |
| ---------------------------------------------------------------- | ----------------------------------------------------------------- |
| `04_JavaWeb/src/musicai/registration/RegistrationServlet.java`   | Registro y PRG.                                                   |
| `04_JavaWeb/src/musicai/registration/LoginServlet.java`          | Ingreso académico.                                                |
| `04_JavaWeb/src/musicai/registration/StudentRegistration.java`   | Modelo de datos de registro.                                      |
| `04_JavaWeb/src/musicai/registration/RegistrationValidator.java` | Validaciones.                                                     |
| `04_JavaWeb/src/musicai/registration/StudentDao.java`            | INSERT y procedimiento.                                           |
| `04_JavaWeb/src/musicai/registration/HtmlEscaper.java`           | Escape contextual HTML.                                           |
| `04_JavaWeb/webapp/WEB-INF/views/register.jsp`                   | Formulario de registro.                                           |
| `04_JavaWeb/webapp/WEB-INF/views/login.jsp`                      | Formulario de ingreso.                                            |
| `04_JavaWeb/webapp/WEB-INF/views/registration-success.jsp`       | Confirmación.                                                     |
| `04_JavaWeb/webapp/js/registration-success.js`                   | Redirección automática.                                           |
| `04_JavaWeb/webapp/WEB-INF/web.xml`                              | Mapeos, JNDI y sesión/cookies.                                    |
| `04_JavaWeb/build.ps1`                                           | Compilación y empaquetado.                                        |
| `04_JavaWeb/sql/student-registration-applied.sql`                | Historial suministrado de migración.                              |
| `04_JavaWeb/sql/tomcat-access-applied.sql`                       | Historial suministrado del principal y permisos iniciales.        |
| `04_JavaWeb/sql/student-exists-applied.sql`                      | Historial suministrado de creación, corrección y GRANT EXECUTE.   |
| `04_JavaWeb/sql/admin-verification.sql`                          | Consultas de verificación suministradas y estado de ejecución.    |
| `04_JavaWeb/test/musicai/registration/RegistrationChecks.java`   | Pruebas de validadores y escape sin dependencias.                 |
| `04_JavaWeb/README.md`                                           | Build, despliegue, ACL, pruebas, operación remota y limitaciones. |

No se autoriza eliminar archivos. `04_JavaWeb/build/` y sus descendientes son derivados ignorados por Git; no se cuentan como fuentes. El inventario admite la incorporación diferida de los cuatro SQL cuando Juan Carlos entregue originales. No ampliar el inventario ni sustituir archivos por rutas diferentes sin aprobación expresa.

## 14. Archivos y entornos protegidos

Todo lo no enumerado en §13 permanece protegido, en especial `index.html`, `02_Source/index.html`, `02_Source/pages/home.html`, restantes páginas, CSS, JS, recursos y fragmentos de `02_Source/`; `03_App/`, `03_Scripts/`, `01_Design/`, `00_Documentation/` (incluyendo requisitos, Baseline, roles, arquitectura y el contrato), `AGENTS.md`, `CLAUDE.md`, `README.md` raíz, `.github/`, `.vscode/` y publicaciones existentes.

Juan Carlos es el único autorizado para publicar/cerrar el contrato, gestionar Git, intervenir SQL Server, Windows, Tomcat, certificados, DLL, JAR, JNDI, ACL externas, datos de pruebas administrativos y Dev Tunnels. ForgeBE no modifica esos entornos ni los otros archivos protegidos. No crear instrucciones permanentes, nuevas capas, scripts auxiliares o artefactos versionados no autorizados.

## 15. Build reproducible

`04_JavaWeb/build.ps1` debe:

1. Validar precondiciones y rutas de herramientas configurables, sin fijar rutas específicas del equipo en código versionado.
2. Generar staging y clases únicamente en `04_JavaWeb/build/`; limpiar únicamente derivados controlados en esa carpeta, sin seguir rutas ajenas.
3. Copiar `02_Source/` en modo de solo lectura respecto a la fuente, manteniendo sus rutas relativas. Si existe `02_Source/WEB-INF` o una colisión con `webapp/`, detener con diagnóstico; no sobrescribir silenciosamente. Incorporar `WEB-INF` y el JS autorizado desde `webapp/`.
4. Compilar con `javac --release 21 -encoding UTF-8`, usando `servlet-api.jar` de Tomcat exclusivamente en el classpath de compilación. Clases en `WEB-INF/classes/`.
5. Empaquetar `04_JavaWeb/build/musicai.war` con `jar`. Excluir Servlet API, JDBC Driver, DLL, PEM, descriptor JNDI externo, SQL, pruebas y herramientas de build. No incluir dependencias nuevas.
6. Verificar códigos de salida, inventario y generar evidencia SHA-256. No desplegar, no ejecutar SQL ni realizar Git automáticamente.

Las pruebas Java estándar podrán compilarse y ejecutarse por separado, con sus clases derivadas dentro de `build/`, sin llegar al WAR. Documentar los comandos reproducibles. No utilizar Maven, Gradle, frameworks ni JSTL.

## 16. Trazabilidad SQL — trabajo diferido, no bloqueante de implementación

Los cuatro archivos SQL autorizados se completarán con los originales efectivamente suministrados por Juan Carlos. Identificar operaciones YA APLICADAS — NO REEJECUTAR, intentos fallidos y correcciones; distinguir las consultas de verificación que se ejecutaron de las aún pendientes. No inventar ni reconstruir históricos y presentarlos como originales. No incorporar datos personales, rutas locales sensibles ni secretos. Si falta la fuente, suspender únicamente el versionamiento de ese archivo, reportar la brecha y solicitarla a Juan Carlos. No crear un supuesto historial ni ejecutar nuevamente DDL/DCL, rollback o limpieza de datos.

La procedencia de los SQL no bloqueará la programación, build ni pruebas locales del módulo con el esquema existente. Su consolidación es requisito de cierre documental, no de inicio.

## 17. Prioridad y secuencia de ejecución

**Fase 1 — Implementación local (prioridad máxima):** inspección de fuentes y preflight; build; bienvenida; clases y JSP de registro, ingreso y confirmación; integración con Home/Ruta; controles básicos de aplicación; pruebas automatizables y build WAR. Entregar resultado verificable a Juan Carlos, sin esperar Dev Tunnels ni originales SQL. Mantener el incremento dentro del inventario aprobado.

**Fase 2 — Integración local:** Juan Carlos despliega e inicia Tomcat; se verifican ambas funcionalidades, persistencia en SSMS, permisos reales, seguridad, errores, regresiones y WAR. ForgeBE documenta resultados y corrige dentro del alcance autorizado.

**Fase 3 — Revisión y despliegue:** consolidar SQL originales y README; Sentinel revisa independientemente la versión local y sus evidencias antes de exposición remota. Juan Carlos configura y comprueba el acceso remoto bajo aprobación específica, y Sentinel valida los resultados remotos. Resolver fallos antes de aceptación final.

**Fase 4 — Cierre académico:** Juan Carlos y ChatGPT elaboran EV01 y EV02 a partir de resultados comprobados. El alcance queda cerrado solo con aceptación humana.

## 18. Despliegue local y remoto — responsabilidad de Juan Carlos

Desplegar `musicai.war` a Tomcat bajo el contexto `/musicai`, con el servicio detenido y el descriptor externo existente. Verificar que no se empaquete configuración sensible. Después de copiar, comprobar y corregir si es necesario ACL del WAR: Tomcat10 RX, SYSTEM y Administradores F, propietario Administradores; conservar el SHA-256 antes/después. Iniciar y probar por loopback. No exponer otros contextos por conveniencia.

Estrategia remota aprobada conceptualmente: Microsoft Dev Tunnels, túnel privado, persistente, HTTPS, un único puerto, acceso exclusivamente autorizado. No habilitar acceso anónimo. No exponer SQL Server, 1433 ni DAC. No abrir puertos entrantes del router o firewall. No modificar publicaciones existentes en Vercel/GitHub Pages. Usar datos ficticios.

El puerto publicado debe servir exclusivamente MusicAI. Verificar que ROOT, manager, host-manager, docs, examples y demás aplicaciones no estén disponibles en él. Si deben coexistir, Daedalus propuso un Service/Engine/Host con appBase dedicado en el mismo servicio Tomcat u otro aislamiento mínimo sujeto a autorización; un segundo Connector en el mismo Service no aísla contextos. No implementar ese cambio externo bajo la autorización de ForgeBE.

Identificar la cuenta del instructor y verificar una vía de acceso nominativa. Evaluar entradas por usuario si están soportadas en la versión disponible o una organización GitHub dedicada y restringida, previa aprobación de Juan Carlos y compatibilidad institucional. No conceder un tenant u organización amplia ni tratar un token al portador como acceso nominativo suficiente. Si no puede demostrarse exclusividad, detener la publicación y solicitar alternativa segura; esto no impide el desarrollo local.

Verificar HTTPS, redirecciones de mismo origen, POST, 303, GET y cookies de confirmación; no confiar en Host o cabeceras reenviadas no verificadas. Probar desde red externa con identidad autorizada y otra no autorizada; incluso la autorizada debe carecer de acceso a otros contextos. Limitar ventana de uso y monitorear volumen sin PII. El equipo anfitrión, la red, SQL Server, Tomcat y el proceso del túnel deben estar disponibles durante la evaluación. Si hay caída, restablecer y repetir prueba o reprogramar. Al concluir, detener el host del túnel y revocar/eliminar acceso, verificando rechazo externo.

Toda configuración del túnel, aislamiento, cookies externas o contenedor se ejecutará solo con aprobación expresa de Juan Carlos. No se declara configurado ni validado en este contrato.

## 19. Criterios de aceptación — implementación e integración local

Registrar por cada identificador el estado (PASS, FAIL, PENDIENTE o NO EJECUTADO), comando/procedimiento, resultado observado, responsable y evidencia depurada. No declarar PASS por inferencia o por solo revisar código.

| ID    | Criterio                                                                                                                                                                                                             |
| ----- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| TA-01 | Bienvenida con los textos exactos y opciones Ingresar/Registrarse funcionales.                                                                                                                                       |
| TA-02 | JSP de registro accesible vía Servlet y protegida directamente bajo WEB-INF; exactamente seis campos.                                                                                                                |
| TA-03 | Registro válido: una fila con los seis valores correctos, comprobada por DBA en SSMS.                                                                                                                                |
| TA-04 | Cada campo obligatorio; vacío y solo espacios rechazados del lado servidor.                                                                                                                                          |
| TA-05 | Límites físicos y formatos aprobados: casos válidos, frontera y rechazo; no truncamiento.                                                                                                                            |
| TA-06 | Nombres Unicode, tildes, ñ, apóstrofos, ceros iniciales y formato de teléfono conservados cuando son válidos.                                                                                                        |
| TA-07 | Duplicidad exacta y por capitalización del correo: mensaje de duplicidad, ninguna fila adicional.                                                                                                                    |
| TA-08 | Mismo documento y correos distintos: ambos registros permitidos.                                                                                                                                                     |
| TA-09 | Dos solicitudes concurrentes válidas con mismo correo, preferentemente desde sesiones independientes para no confundir la prueba de unicidad con CSRF o consumo del flash: un éxito, una duplicidad y una sola fila. |
| TA-10 | PRG 303, flash auténtico de un uso, éxito y barra animada de tres segundos, redirección automática y recarga sin reinserción; acceso directo a confirmación sin flash rechazado.                                     |
| TA-11 | Mensajes de registro y tratamiento visual aprobados; conservar entradas escapadas en errores.                                                                                                                        |
| TA-12 | Ingreso con correo registrado y cualquier contraseña simulada no vacía, incluyendo capitalización diferente del correo: navegación a Home.                                                                           |
| TA-13 | Correo inexistente: no ingresar, mensaje e invitación exactos y enlace funcional al registro.                                                                                                                        |
| TA-14 | Ingreso: correo vacío o inválido rechazado por servidor; contraseña vacía rechazada en interfaz; solicitud directa evidencia limitación de la simulación.                                                            |
| TA-15 | Contraseña no transmitida, persistida, comparada ni logueada; credenciales codificadas eliminadas.                                                                                                                   |
| TA-16 | Fallo controlado de SQL Server: respuesta técnica segura, sin falso éxito ni falso correo inexistente.                                                                                                               |
| TA-17 | INSERT y CallableStatement parametrizados; entradas de prueba de inyección no alteran consultas ni datos no autorizados.                                                                                             |
| TA-18 | Escape contextual y pruebas XSS; no ejecutar entradas HTML/JS; no registrar PII ni diagnóstico crudo.                                                                                                                |
| TA-19 | Protección CSRF de registro, límites de petición, métodos, tipos y cabeceras; sesión temporal no autenticada; no session id en URL.                                                                                  |
| TA-20 | Llamada real del SP desde servicio Tomcat10 para correo existente e inexistente; confirmar respuesta BIT válida.                                                                                                     |
| TA-21 | Token real del servicio tras el GRANT: SID, INSERT/EXECUTE efectivos y ausencia de SELECT/UPDATE/DELETE/ALTER/CONTROL directos, sin privilegios administrativos.                                                     |
| TA-22 | Conectividad real JNDI y JDBC, NTLM/TCP, cifrado y TDS 8.0 comprobados; prueba negativa del certificado bajo control del DBA/administrador, con una conexión nueva y restauración segura.                            |
| TA-23 | Build reproducible, WAR válido sin dependencias/configuraciones prohibidas, hash e inventario, ACL verificadas por Juan Carlos.                                                                                      |
| TA-24 | Home/Ruta sin modificaciones ni regresiones; recursos relativos y fragmentos cargados correctamente.                                                                                                                 |
| TA-25 | Pruebas de validador y escaper ejecutables con Java estándar y documentación reproducible.                                                                                                                           |

No usar datos personales reales. El DBA administra filas de prueba y cualquier limpieza previamente autorizada. Para comprobar permisos efectivos con el token real y la prueba negativa TLS, Juan Carlos puede autorizar una prueba diagnóstica temporal fuera del repositorio y del WAR definitivo, con conexión nueva y restauración de la configuración; retirar cualquier diagnóstico antes de publicar remotamente. No introducir endpoints de diagnóstico en el módulo entregable. Si precisa intervenir infraestructura (incluida prueba de caída o certificado incorrecto), coordinar con Juan Carlos; no realizarlo desde ForgeBE. Las pruebas exclusivas de despliegue externo se evalúan en §20, no bloquean Fase 1.

## 20. Criterios de aceptación — despliegue remoto

| ID    | Criterio                                                                                                                      |
| ----- | ----------------------------------------------------------------------------------------------------------------------------- |
| TR-01 | URL HTTPS funcional desde red externa con acceso nominativo del instructor.                                                   |
| TR-02 | Cuenta ajena rechazada; acceso anónimo deshabilitado.                                                                         |
| TR-03 | Puerto dedicado o aislado efectivamente; contextos ajenos no accesibles ni con cuenta autorizada.                             |
| TR-04 | Registro real por URL remota, PRG, confirmación y Home/Ruta; verificación administrativa de persistencia.                     |
| TR-05 | Ingreso por URL remota con correo existente e inexistente, y navegación correcta.                                             |
| TR-06 | Cookies de sesión remota Secure, HttpOnly, SameSite=Lax y Path del contexto; POST/303/GET funcionales, sin fuga por URL.      |
| TR-07 | SQL Server permanece restringido a loopback; no publicado por túnel ni mediante apertura de 1433.                             |
| TR-08 | Ventana de evaluación acordada; procedimiento de reinicio/recuperación y cierre; revocación efectiva comprobada externamente. |

La implementación local y el despliegue remoto tienen gates distintos. Sin TR-01–TR-08 verificados no se declarará lista la entrega remota. El cierre/revocación se comprueba al concluir el acceso de evaluación; mientras la ventana esté autorizada, permanece como actividad operativa pendiente.

## 21. Condiciones de parada

Detener el trabajo afectado, preservar el estado y escalar a Juan Carlos si:

- falta autorización activa, hay divergencia material de Git o de alcance, o conflicto no cubierto por la separación académica;
- se requiere modificar un archivo protegido, ampliar el inventario, incorporar otra clase/dependencia o cambiar una decisión funcional/arquitectónica;
- el esquema, procedimiento o JNDI no coincide, o se requiere ampliar permisos, ejecutar DDL/DCL, cambiar el runtime o manipular datos administrativos;
- una validación de seguridad falla o el código/renderizado presenta una vulnerabilidad no resuelta; corregir dentro del alcance o escalar;
- faltan originales SQL: detener solo su versionamiento, no la implementación restante;
- falla autorización nominativa, aislamiento del puerto, HTTPS, POST o cookies remotas: detener solo la publicación remota y no recurrir a acceso anónimo.

Los problemas corregibles dentro del inventario y las decisiones aprobadas pueden resolverse y volver a probarse. No detener todo el lote por un pendiente independiente. Daedalus recibe desviaciones arquitectónicas; Juan Carlos decide cambios de alcance. No iniciar una ronda general adicional de arquitectura si no aparece una desviación material.

## 22. Entregables, handoff y cierre

ForgeBE entrega relación exacta de archivos creados/modificados, comandos de build y pruebas, inventario y SHA-256 del WAR, explicación técnica paso a paso por archivo (propósito, estructura, flujo, entradas/salidas, decisiones, configuración, errores, validación y limitaciones) y evidencia del estado observado. Documenta la instalación externa como precondición y el procedimiento administrativo para Juan Carlos, sin ejecutarlo. Reporta SQL históricos pendientes hasta recibir originales, y resultados de pruebas distinguiendo ejecutadas de pendientes. Mantener el README del módulo actualizado sin tocar el README raíz.

El informe para Sentinel debe incluir base técnica y commit de activación/revisión si existe, diff y alcance, criterios TA/TR y resultados, evidencia depurada de persistencia, JDBC, Ownership Chaining, permisos efectivos, TLS, navegación, aislamiento y revocación, con limitaciones explícitas. Sentinel revisa independientemente, no implementa ni modifica decisiones.

La documentación de EV01 y EV02 explicará qué hicimos, cómo, por qué, dificultades y correcciones (incluidos error 207 de migración, separación GO del SP y ACL del WAR), cómo comprobamos y qué limitaciones permanecen. Justificar JSP/Servlet, DAO, JDBC/JNDI, PreparedStatement/CallableStatement, SP/Ownership Chaining, integridad y concurrencia, mínimo privilegio, Windows Integrated Authentication, cifrado TDS 8.0, validaciones, PRG/flash, UX, seguridad y despliegue controlado. No presentar intentos ni pruebas pendientes como éxitos. Juan Carlos con ChatGPT elabora las evidencias finales.

Condiciones de finalización: implementación dentro del inventario aprobado, pruebas locales satisfechas, revisión independiente, trazabilidad SQL con procedencia verificada, despliegue remoto comprobado y cierre de evaluación según su ventana, documentación académica sustentada y aprobación final de Juan Carlos. La finalización de ForgeBE local no equivale a aceptación de las evidencias completas.

Juan Carlos conserva la aprobación, las operaciones Git y el cierre de `current.md`. ForgeBE no cambia el estado del contrato.
