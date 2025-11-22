#import "../../../../../cross/packages/packages/preview/tidbit-uoc/0.1.1/template.typ": template

#show: template.with(
    subject: "Herramientas HTML y CSS II",
    title: "PEC 2: CSS Moderno y Librerías de Componentes",
    subtitle: "Desarrollo de un sitio web responsive con Sass, Bootstrap y técnicas avanzadas de CSS",
    date: datetime(year: 2025, month: 11, day: 22),
    author: "Daniel Ramos Acosta",
)

#outline()

= Introducción

Este informe documenta el desarrollo completo de la *PEC 2* de la asignatura Herramientas HTML y CSS II de la Universitat Oberta de Catalunya (UOC). El proyecto consiste en la creación de un sitio web responsive sobre las *Jornadas de Cocina Tradicional Canaria 2025*, un evento ficticio que celebra la gastronomía y las tradiciones culinarias de las Islas Canarias.

== Objetivos del proyecto

El proyecto tiene como objetivos principales:

- Diseñar y desarrollar un sitio web responsive de 4 páginas siguiendo los wireframes proporcionados
- Implementar un workflow de desarrollo frontend moderno utilizando el UOC Boilerplate (v3.12.0)
- Aplicar metodologías y guías de estilo CSS (SMACSS en este caso)
- Utilizar técnicas avanzadas de maquetación: CSS Grid, Flexbox, Container Queries y Cascade Layers
- Integrar y personalizar la librería Bootstrap 5
- Implementar características CSS modernas: pseudoclases funcionales, nuevas unidades y colores
- Configurar y aplicar Stylelint según la metodología elegida
- Publicar el proyecto en GitHub y realizar un deployment en Netlify

== Tecnologías utilizadas

El stack tecnológico del proyecto incluye:

- *UOC Boilerplate 3.12.0*: entorno de desarrollo basado en Parcel
- *HTML5*: estructura semántica y accesible
- *Sass/SCSS*: preprocesador CSS más ampliamente utilizado
- *Bootstrap 5.3.8*: framework CSS personalizado mediante variables Sass
- *PostCSS*: autoprefixer y preset-env para compatibilidad cross-browser
- *Stylelint*: linter CSS configurado para SMACSS
- *Parcel*: empaquetador y servidor de desarrollo
- *Git/GitHub*: control de versiones
- *Netlify*: plataforma de hosting y deployment

= Proceso de Desarrollo

== Configuración inicial

En la PEC anterior se optó por diseñar un boilerplate personalizado mediante Vite. En esta ocasión, se ha seleccionado el boilerplate oficial *UOC Boilerplate* con el objetivo de facilitar el proceso de evaluación, reducir discrepancias respecto a otros estudiantes de la asignatura y garantizar una mayor paridad en las condiciones de desarrollo.

=== Pasos realizados

1. *Clonación del boilerplate*:

```bash
git clone https://github.com/uoc-advanced-html-css/uoc-boilerplate.git hhyc2-pec2
cd hhyc2-pec2
```

2. *Instalación de dependencias*:

```bash
npm install
```

Este comando instaló todas las dependencias especificadas en el `package.json`, incluyendo:
- Parcel 2.16.1 (empaquetador)
- Sass transformer para Parcel
- PostCSS con autoprefixer y preset-env
- PostHTML Include para parciales HTML
- Rimraf para limpieza de directorios
- Sharp para optimización de imágenes

3. *Instalación de dependencias adicionales*:

A medida que se desarrolló la práctica, fue necesario incorporar diversas dependencias. En particular, se añadieron librerías para la gestión de iconos (Font Awesome), fuentes tipográficas personalizadas y, especialmente, reglas de linting específicas para la metodología de arquitectura CSS seleccionada (SMACSS).

```bash
npm install bootstrap @fortawesome/fontawesome-free
npm install @fontsource/lato @fontsource/playfair-display
npm install --save-dev stylelint stylelint-config-standard-scss stylelint-config-property-sort-order-smacss
```

4. *Verificación de la instalación*:

Para verificar que todas las dependencias se habían instalado correctamente, se ejecutó el proceso de build para construir la aplicación mediante el siguiente comando.

```bash
npm run build
```

La salida del comando se puede observar en la @fig-npm-run-build.

#figure(
  image("./images/npm-run-build.jpg"),
  caption: [Captura de la terminal ejecutando npm run build]
) <fig-npm-run-build>

== Entorno de desarrollo

El UOC Boilerplate que se nos proporciona en la asignatura, incluye un entorno de desarrollo completo y optimizado basado en Parcel, con scripts npm predefinidos para las tareas más comunes.

=== Scripts disponibles

```json
{
  "scripts": {
    "dev": "npm-run-all clean parcel:serve",
    "build": "npm-run-all clean parcel:build",
    "clean": "rimraf dist .cache .cache-loader .parcel-cache",
    "lint:css": "stylelint \"src/**/*.scss\"",
    "lint:css:fix": "stylelint \"src/**/*.scss\" --fix"
  }
}
```

=== Workflow de desarrollo

El desarrollo de la práctica consistió en iniciar el servidor de desarrollo mediante el siguiente comando:


```bash
npm run dev
```

Se puede observar un ejemplo de la salida del servidor de desarrollo en la @fig-dev-server.

#figure(
  image("./images/dev-server.jpg"),
  caption: [Captura de la terminal ejecutando npm run dev]
) <fig-dev-server>

=== Conclusiones

Además de lo anterior, el boilerplate de la UOC incluye herramientas adicionales con las que ya se ha trabajado en la PEC anterior, como PostHTML o Sharp para el procesamiento de imágenes. Sin embargo, no se profundizará en estos aspectos, considerando que no constituyen el foco principal de esta PEC, cuyo énfasis radica en la implementación de CSS moderno y Bootstrap.

= Arquitectura y Metodología CSS

== Elección de metodología SMACSS

En la PEC anterior se decidió y justificó la adopción de BEM como metodología de organización de estilos. Sin embargo, en esta PEC se ha optado por utilizar *SMACSS (Scalable and Modular Architecture for CSS)* como metodología de arquitectura CSS. La justificación de esta elección se desarrollará en el siguiente apartado.

=== Justificación de la elección

En primer lugar, en la PEC anterior ya se implementó BEM con ciertos elementos de SMACSS, por lo que en esta PEC se ha decidido utilizar este último con el propósito de ampliar conocimientos y mejorar la perspectiva sobre arquitecturas CSS.

Tras revisar el material de estudio, particularmente sobre Cascade Layers como nueva característica de CSS, se considera que SMACSS se integra de forma natural y efectiva. SMACSS define una serie de capas que progresan de lo más básico a lo más complejo, acumulándose jerárquicamente, lo que se alinea muy bien con Cascade Layers, ya que cada capa de SMACSS puede corresponder a una capa de Cascade Layer. Más adelante se profundizará en este aspecto.

Tras estudiar SMACSS en profundidad, se ha considerado que representa una arquitectura bien estructurada, aunque desde una perspectiva diferente a BEM. Mientras que BEM tiende a enfatizar la componentización, SMACSS organiza los estilos en distintas capas. Sin embargo, la capa de modules permite crear componentes visuales, siendo este el espacio apropiado para su desarrollo. Por tanto, SMACSS constituye una alternativa interesante y viable.

Además, SMACSS tiene un amplio apoyo comunitario. La consulta de diversos tutoriales y documentación disponible ha facilitado la comprensión profunda de su funcionamiento, y la curva de aprendizaje ha resultado ser moderada.

== Aplicación de criterios

=== Estructura de capas implementada

Los archivos CSS se encuentran organizados siguiendo esta arquitectura basada en capas. El archivo main.sass es responsable de importar todos los parciales de SASS y encapsularlos en su propia capa correspondiente. Cada capa mantiene una correspondencia uno a uno con las capas recomendadas por la arquitectura SMACSS:

```scss
@layer framework, base, layout, modules, state, theme;
```

Esta declaración en `main.scss` establece el orden de prioridad (de menor a mayor):

1. *framework*: Estilos de Bootstrap y dependencias externas
2. *base*: Estilos base, tipografía, variables
3. *layout*: Componentes estructurales (containers, grid systems)
4. *modules*: Componentes modulares reutilizables
5. *state*: Estados de los componentes (active, hidden, etc.)
6. *theme*: Temas y variaciones visuales

=== Organización de archivos

La organización de los archivos CSS también sigue las recomendaciones de la arquitectura, con un directorio dedicado a cada capa y una posterior modularización en parciales más pequeños dentro de cada uno:

```
src/assets/styles/
├── main.scss                     # Punto de entrada, define @layers
├── _dependencies.scss            # Bootstrap y dependencias externas
├── base/
│   ├── _bootstrap-variables.scss # Variables personalizadas de Bootstrap
│   ├── _colors.scss              # Sistema de colores
│   ├── _variables.scss           # Variables del proyecto
│   ├── _reset.scss               # Reset CSS
│   ├── _typography.scss          # Tipografía base
│   ├── _responsive.scss          # Mixins responsive
│   └── _interactions.scss        # Estilos de interacción
├── layout/
│   ├── _container.scss           # Contenedores
│   └── _structure.scss           # Estructura general
├── modules/
│   ├── _header.scss              # Cabecera
│   ├── _footer.scss              # Pie de página
│   ├── _hero.scss                # Hero/portada
│   ├── _speakers.scss            # Grid de ponentes
│   ├── _article.scss             # Página de artículo
│   ├── _contest.scss             # Página de concurso
│   ├── _buttons.scss             # Botones
│   ├── _logo.scss                # Logo
│   └── _social-icons.scss        # Iconos sociales
└── state/
    └── _states.scss              # Estados (hover, active, etc.)
```

=== Archivo main.scss

Además de la declaración de las capas de SMACSS mediante Cascade Layers, este archivo contiene las importaciones de los distintos parciales en sus capas correspondientes, actuando como *punto central de integración* donde se unifican todos los componentes de la arquitectura.

```scss
@layer framework, base, layout, modules, state, theme;

@layer framework {
  @import "dependencies";
}

@layer base {
  @import "base/reset";
  @import "base/colors";
  @import "base/variables";
  @import "base/responsive";
  @import "base/typography";
  @import "base/interactions";
}

@layer layout {
  @import "layout/container";
  @import "layout/structure";
}

@layer modules {
  @import "modules/header";
  @import "modules/footer";
  @import "modules/buttons";
  @import "modules/social-icons";
  @import "modules/logo";
  @import "modules/hero";
  @import "modules/speakers";
  @import "modules/article";
  @import "modules/contest";
}

@layer state {
  @import "state/states";
}
```

=== Nomenclatura BEM para clases

Al igual que en la PEC anterior, se ha realizado una integración con otros enfoques arquitectónicos. En aquella ocasión, BEM constituía la arquitectura predominante, complementada con ciertos aspectos de SMACSS mediante la definición de estilos base.

En esta PEC, se ha invertido esta proporción. SMACSS se establece como la arquitectura predominante y eje central de la organización de estilos, tal como se refleja tanto en la declaración de capas como en la estructuración del código. No obstante, se considera valiosa la nomenclatura de BEM para la designación de clases CSS, ya que proporciona una clara distinción entre el componente y sus elementos internos constitutivos.

En consecuencia, a pesar de que la arquitectura general responde a SMACSS, se mantiene la nomenclatura de BEM para las clases CSS.

- *Bloques*: `.speaker-card`, `.contest-hero`
- *Elementos*: `.speaker-card__name`, `.contest-hero__title`
- *Modificadores*: `.header--overlay`, `.button--primary`

Ejemplo de un módulo siguiendo SMACSS + BEM (`_speakers.scss:59`):

```scss
.speakers {
  container-type: inline-size;
  container-name: speakers;
}

.speakers__title {
  margin-bottom: var(--spacing-xl);
  text-align: center;
}

.speaker-card {
  container-type: inline-size;
  container-name: speaker-card;

  @container speaker-card (min-width: 250px) {
    .speaker-card__name {
      font-size: var(--font-size-xl);
    }
  }
}
```

== Configuración de Stylelint

En esta PEC también se han configurado las reglas de stylelint para que se alineen tanto con la arquitectura SMACSS como con la nomenclatura de las clases de BEM.

=== Archivo .stylelintrc.json

Aquí podemos encontrar un fragmento del archivo `.stylelintrc.json` utilizado:

```json
{
  "extends": [
    "stylelint-config-standard-scss",
    "stylelint-config-property-sort-order-smacss"
  ],
  "rules": {
    "selector-class-pattern": [
      "^([a-z][a-z0-9]*)(-[a-z0-9]+)*(__[a-z0-9]+(-[a-z0-9]+)*)?(--[a-z0-9]+(-[a-z0-9]+)*)?$",
      {
        "message": "Expected class selector to follow SMACSS/BEM naming convention"
      }
    ],
    "selector-max-specificity": "0,5,0",
    "max-nesting-depth": 4,
    "selector-id-pattern": null,
    "no-descending-specificity": null
  }
}
```

=== Plugins utilizados

*stylelint-config-standard-scss* proporciona una configuración estándar para Sass/SCSS que implementa reglas de buenas prácticas recomendadas por la comunidad, asegurando consistencia y calidad en el código de estilos.

*stylelint-config-property-sort-order-smacss* ordena automáticamente las propiedades CSS conforme al orden recomendado por la arquitectura SMACSS. Este orden se estructura en categorías progresivas: Box (propiedades de disposición y dimensiones como display, position, width, height), Border (propiedades de borde), Background (propiedades de fondo), Text (propiedades tipográficas y de color) y Other (otras propiedades), facilitando la legibilidad y consistencia del código.

=== Reglas personalizadas

*selector-class-pattern* valida que las clases CSS sigan estrictamente el patrón de nomenclatura BEM mediante expresiones regulares. Esta validación garantiza la consistencia en la nomenclatura de bloques (`speaker-card`), elementos (`speaker-card__name`) y modificadores (`speaker-card--featured`).

*selector-max-specificity: "0,5,0"* limita la especificidad máxima permitida a cinco clases, previniendo la creación de selectores excesivamente específicos que comprometerían el mantenimiento y la reutilización del código.

*max-nesting-depth: 4* restringe el anidamiento en Sass a un máximo de cuatro niveles, evitando la generación de selectores innecesariamente complejos que dificulten su legibilidad y gestión.

=== Validación

Durante el desarrollo, se ejecutó regularmente `npm run lint:css` para garantizar el cumplimiento de las reglas. Al finalizar el proyecto, no se registraron errores de Stylelint. En la @fig-stylelint-no-errors se puede observar una captura de la terminal mostrando la ejecución del comando sin errores.

#figure(
  image("./images/stylelint-without-errors.jpg"),
  caption: [Captura de la terminal mostrando npm run lint:css sin errores]
) <fig-stylelint-no-errors>

= Dependencias y Personalización

== Bootstrap 5.3.8

Uno de los requisitos fundamentales de esta práctica evaluable, así como de los objetivos de aprendizajes establecidos en los módulos de estudio del curso, consistía en familiarizarnos exhaustivamente con *Bootstrap y* profundizar en el dominio de este framework CSS ampliamente utilizado en el desarrollo web contemporáneo.

En consecuencia, se procedió a la integración de Bootstrap 5 en la arquitectura del proyecto, siguiendo las mejores prácticas recomendadas.

Existen múltiples aproximaciones para la instalación e incorporación de Bootstrap en un proyecto web. Estas incluyen la vinculación mediante CDN, la descarga directa de archivos compilados, o la instalación como dependencia a través de gestores de paquetes. Sin embargo, tras analizar las diferentes alternativas disponibles, se determinó que el enfoque más apropiado consiste en la *importación progresiva y modular de los parciales SASS que Bootstrap expone mediante su paquete oficial de npm*.

Esta metodología presenta ventajas significativas desde el punto de vista del desarrollo profesional. En primer lugar, permite declarar *variables SASS personalizadas que modifican el comportamiento* predeterminado del framework, facilitando así la creación de un theme completamente adaptado a las necesidades específicas del proyecto. En segundo lugar, ofrece un control granular sobre qué componentes y funcionalidades de Bootstrap se incorporan al bundle final, optimizando el peso de los archivos resultantes.

Es importante señalar que, en el momento de desarrollo de este proyecto, Bootstrap aún no ha completado la migración de su base de código al nuevo sistema de módulos `@use` introducido en las versiones modernas de Sass. Esta circunstancia genera numerosas advertencias (warnings) relacionadas con la deprecación de las directivas `@import` durante el proceso de compilación ejecutado mediante el comando npm run build. Si bien estas advertencias no comprometen la funcionalidad del proyecto, representan una limitación técnica heredada de la arquitectura actual de Bootstrap que debemos asumir temporalmente, hasta que el equipo de desarrollo del framework proporcione una alternativa compatible con las especificaciones más recientes de Sass.

=== Instalación

La instalación de boostrap se realizó mediante npm:

```bash
npm install bootstrap@5.3.8
```

=== Carga modular en `_dependencies.scss`

El archivo `src/assets/styles/_dependencies.scss` se encarga de importar los parciales SASS de Bootstrap de forma modular, seleccionando únicamente aquellos componentes necesarios para el proyecto. Además, estos estilos se encapsulan dentro de la capa `@layer framework` definida en `main.scss`, garantizando así que los estilos de Bootstrap tengan una prioridad menor que los estilos personalizados del proyecto.

```scss
@import "base/bootstrap-variables";
@import "~bootstrap/scss/functions";
@import "~bootstrap/scss/variables";
@import "~bootstrap/scss/variables-dark";
@import "~bootstrap/scss/maps";
@import "~bootstrap/scss/mixins";

@layer framework {
  @import "~bootstrap/scss/utilities";
  @import "~bootstrap/scss/root";
  @import "~bootstrap/scss/reboot";
  @import "~bootstrap/scss/type";
  @import "~bootstrap/scss/images";
  @import "~bootstrap/scss/containers";
  @import "~bootstrap/scss/grid";
  @import "~bootstrap/scss/forms";
  @import "~bootstrap/scss/buttons";
  @import "~bootstrap/scss/nav";
  @import "~bootstrap/scss/navbar";
  @import "~bootstrap/scss/card";
  @import "~bootstrap/scss/badge";
  // ... otros componentes
}
```

Esta aproximación tiene varias ventajas técnicas significativas. Por un lado, realiza una carga selectiva de los módulos necesarios, reduciendo el tamaño del CSS final. Por otro lado, aplica los estilos de Bootstrap dentro de la capa `@layer framework`, dándoles menor prioridad que los estilos personalizados.

=== Variables personalizadas

En primer lugar, se intentaron definir variables centralizadas de SASS usando funciones de color avanzadas como `oklab` o `color-mix()`. Sin embargo, Bootstrap presenta limitaciones de compatibilidad con estas funciones, lo que impide su correcto funcionamiento. Por este motivo, se optó por definir colores hexadecimales estáticos que garantizan la compatibilidad total con Bootstrap.

Se definieron variables personalizadas antes de importar Bootstrap (`base/_bootstrap-variables.scss`):

```scss
// Colores temáticos canarios
$canary-red: #c9302c;
$canary-red-light: #e57373;
$canary-red-dark: #8e2320;
$canary-yellow: #f4c430;
$canary-yellow-light: #fff9c4;
$canary-yellow-dark: #d4a400;
$canary-green: #6b9b7f;
$canary-green-light: #a5d6a7;
$canary-green-dark: #4a7c59;

// Mapa de colores del tema
$theme-colors: (
  "primary": $canary-red,
  "secondary": $canary-yellow,
  "success": $canary-green,
  "info": $canary-green-light,
  "warning": $canary-yellow-dark,
  "danger": $canary-red-dark
);

// Tipografía
$font-family-sans-serif: 'Lato', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
$font-family-base: $font-family-sans-serif;
$headings-font-family: 'Playfair Display', Georgia, "Times New Roman", serif;
$headings-font-weight: 700;
```

=== Justificación de los colores

Dado que el contenido de la página trata sobre unas jornadas de cocina tradicional canaria, se decidió emplear una paleta de colores inspirada en los tonos característicos de los denominados "guachinches" canarios, que son establecimientos típicos donde se sirven platos tradicionales acompañados de vinos locales.

Estos colores (rojo, amarillo y verde) se suelen ver representados en distintos lugares de las Islas Canarias (aunque no en la bandera oficial). Por ejemplo, en la vestimenta tradicional, en la decoración de los guachinches y en diversos elementos culturales y turísticos.

Además, estos colores pueden interpretarse simbólicamente de la siguiente manera:

- *Rojo*: símbolo de la cultura canaria
- *Amarillo*: sol y playas
- *Verde*: naturaleza y paisajes volcánicos

=== Componentes de Bootstrap utilizados

En las páginas del sitio en las que se nos proporcionan wireframes, se han implementado los componentes de boostrap que se han considerado más adecuados para cada sección.

Sin embargo, en la página libre, que finalmente se ha implementado como un formulario para hacer el registro en un concurso de recetas, se han utilizado muchos más componentes de Bootstrap para aprovechar al máximo las funcionalidades que ofrece el framework. A continuación se detallan los componentes utilizados en cada página:

==== Página de Inicio (index.html)

La página de inicio mantiene un diseño minimalista centrado en el hero principal. El único componente de Bootstrap presente es el *Navbar* (incluido a través del parcial `header.html`), que proporciona la navegación responsive del sitio.

==== Página de Ponentes (speakers.html)

Esta página implementa los siguientes componentes de Bootstrap:

- *Navbar*: Sistema de navegación responsive compartido por todas las páginas (incluido desde `header.html`)
- *Card*: Componente principal utilizado para presentar la información de cada ponente. Cada tarjeta incluye:
  - `card`: Contenedor principal de la tarjeta
  - `card-img-top`: Imagen del ponente en la parte superior
  - `card-body`: Contenedor del contenido de la tarjeta
  - `card-title`: Nombre del ponente
  - `card-text`: Biografía y atribuciones de la imagen

El componente Card se repite seis veces en una cuadrícula personalizada (implementada con Flexbox según los requisitos del proyecto, no con el sistema de grid de Bootstrap).

==== Página de Artículo (article.html)

En esta página no se hace uso de componentes de Bootstrap. Al igual que la página de inicio, el único componente presente es el *Navbar* incluido a través del parcial `header.html`. El resto del layout y estilos son completamente personalizados.

==== Página de Concurso (contest.html)

La página de concurso es la más completa en términos de implementación de componentes de Bootstrap, aprovechando al máximo las funcionalidades del framework:

*Componentes principales implementados:*

1. *Navbar*: Sistema de navegación responsive (incluido desde `header.html`)

2. *Badge*: Utilizado en múltiples contextos:
   - Indicador de "¡Inscripciones Abiertas!" en el hero (clase `bg-success`)
   - Iconos de cada fase del timeline (con diferentes colores: `bg-success`, `bg-primary`, `bg-warning`, `bg-danger`)
   - Etiquetas de año de los ganadores en testimonios (clase `bg-warning text-dark`)

3. *Sistema de Grid* (Container, Row, Col):
   - `container`: Contenedor principal responsive usado en todas las secciones
   - `row`: Filas para organizar el contenido
   - `col-lg-8`, `col-md-4`: Sistema de columnas responsive para diferentes breakpoints
   - Utilizado especialmente en la sección de premios y en el layout del formulario

4. *Form Controls*: Sistema completo de formularios de Bootstrap:
   - `form-control`: Inputs y textarea básicos
   - `form-floating`: Labels flotantes para una mejor UX
   - `form-select`: Select estilizado
   - `form-check` y `form-check-input`: Checkbox para aceptación de términos
   - `input-group` y `input-group-text`: Agrupación de input con iconos
   - `valid-feedback` y `invalid-feedback`: Mensajes de validación
   - `form-text`: Texto de ayuda para campos

5. *Button*: Botones estilizados de Bootstrap:
   - `btn btn-primary btn-lg`: Botón principal de envío del formulario
   - `btn btn-secondary`: Botón secundario en modales
   - `btn-close`: Botón de cierre de modales

6. *Card*: Usado en dos contextos diferentes:
   - Tarjetas de premios (con modificador `h-100` para altura uniforme)
   - Tarjetas de testimonios dentro del carrusel

7. *List Group*: Implementado en la sección de "Bases del Concurso" para presentar las reglas de forma estructurada (`list-group` y `list-group-item`)

8. *Progress Bar*: Barras de progreso utilizadas en el timeline del concurso para conectar visualmente las diferentes fases (`progress` y `progress-bar` con diferentes colores)

9. *Accordion*: Componente desplegable para la sección de Preguntas Frecuentes (FAQ):
   - `accordion`: Contenedor principal
   - `accordion-item`: Cada pregunta individual
   - `accordion-header`: Encabezado clickeable
   - `accordion-button`: Botón de expansión/colapso
   - `accordion-collapse`: Contenido desplegable
   - `accordion-body`: Cuerpo de cada respuesta

10. *Carousel*: Implementado en dos secciones:
    - Carrusel de testimonios con indicadores y controles
    - Carrusel de galería de imágenes con efecto fade (`carousel-fade`)
    - Incluye: `carousel-indicators`, `carousel-inner`, `carousel-item`, `carousel-caption`, `carousel-control-prev/next`

11. *Modal*: Dos modales diferentes:
    - Modal de visualización de imágenes en tamaño completo (`modal-xl` para tamaño extra grande)
    - Modal de bases del concurso con scroll (`modal-dialog-scrollable`)
    - Componentes: `modal-dialog`, `modal-content`, `modal-header`, `modal-body`, `modal-footer`

12. *Alert*: Componente de alerta informativa al final de la página (`alert alert-info` con `alert-heading` y `alert-link`)

13. *Utility Classes*: Amplio uso de clases de utilidad de Bootstrap:
    - Espaciado: `mb-4`, `me-2`, `ms-auto`, `mx-auto`
    - Display: `d-grid`, `d-flex`, `d-block`, `d-none d-md-block`
    - Texto: `text-center`, `text-dark`
    - Sizing: `h-100`, `w-100`
    - Flex: `justify-content-between`, `align-items-center`, `flex-grow-1`
    - Grid: `gap-2`, `g-4`
    - Visibility: `visually-hidden`

*Justificación de la implementación extensiva:*

La página de concurso se diseñó como la página libre del proyecto, lo que permitió explorar e intentar demostrar el dominio de una variedad de componentes de Bootstrap.

Se ha escogido componentes de Bootstrap que se han considerado cohesivos con el contenido de la página: el formulario requiere controles de entrada robustos, el timeline necesita elementos visuales secuenciales, las FAQ se benefician del formato de acordeón para mejor legibilidad, y los testimonios y galería aprovechan el carrusel para mostrar múltiples elementos de forma compacta y atractiva.

#figure(
  image("./images/faq.jpg"),
  caption: [Captura del acordeón de Preguntas Frecuentes implementado con Bootstrap]
) <fig-faq>

== Tipografías personalizadas

Para aportar personalidad y mejorar la jerarquía visual del sitio web, se ha implementado un sistema tipográfico personalizado utilizando dos familias de fuentes diferentes. En lugar de depender de servicios externos como Google Fonts CDN, se optó por utilizar los paquetes npm de `@fontsource`, que permiten incluir las fuentes directamente en el bundle de CSS compilado. Esta aproximación ofrece ventajas significativas en términos de rendimiento (las fuentes se sirven desde el mismo dominio, evitando requests adicionales a servidores externos), control de versiones (las fuentes quedan fijadas en el `package.json`), y compatibilidad con el flujo de trabajo moderno basado en empaquetadores como Parcel.

La implementación técnica consiste en importar los archivos CSS específicos de cada peso de fuente necesario en el archivo `_dependencies.scss`, que posteriormente es incluido dentro de la capa `@layer framework` del sistema de capas en cascada. Las fuentes se declaran mediante variables CSS personalizadas en `base/_typography.scss` (`--font-family-heading` para Playfair Display y `--font-family-body` para Lato), lo que facilita su mantenimiento y reutilización consistente a lo largo de todos los módulos del proyecto. Además, estas mismas fuentes se configuran en las variables de Bootstrap (`$headings-font-family` y `$font-family-base`) para garantizar que los componentes del framework también hereden la tipografía personalizada del proyecto. De esta manera, se consigue una integración completa y coherente del sistema tipográfico en todos los niveles de la arquitectura CSS.

La instalación se realizó como con cualquier otra librería npm:

```bash
npm install @fontsource/lato @fontsource/playfair-display
```

En la @fig-h1-playfair se puede observar una captura de pantalla de un `h1` utilizando la tipografía Playfair Display.

#figure(
  image("./images/typography.jpg"),
  caption: [Captura de un `h1` utilizando Playfair Display]
) <fig-h1-playfair>

=== Instalación

```bash
npm install @fontsource/lato @fontsource/playfair-display
```

== FontAwesome 7.1.0

Tanto para cumplir con los wireframes proporcionados como para mejorar la experiencia visual, se integró *FontAwesome 7.1.0* como librería de iconografía. Esta solución ofrece un catálogo extenso de iconos vectoriales escalables que se adaptan perfectamente a cualquier tamaño de pantalla sin pérdida de calidad. Los iconos de FontAwesome aportan claridad visual al formulario de inscripción, facilitan la identificación rápida de las secciones de premios y bases del concurso, y proporcionan reconocibles símbolos de redes sociales en el footer. La implementación se realizó mediante la importación de los archivos CSS necesarios en el archivo `main.js`. Se puede observar un ejemplo del footer en la @fig-font-awesome.


#figure(
  image("./images/font-awesome.jpg"),
  caption: [Iconos de FontAwesome implementados en el formulario de concurso]
) <fig-font-awesome>

=== Iconos utilizados

En el *formulario de concurso*, se emplearon iconos que facilitan la identificación visual de cada campo: `fa-user` para el nombre del participante, `fa-envelope` para el correo electrónico, `fa-phone` para el teléfono de contacto, `fa-utensils` para la categoría de la receta, `fa-file-alt` para la descripción y `fa-paper-plane` en el botón de envío. La sección de *premios* incorpora iconografía distintiva con `fa-trophy` para el primer premio, `fa-medal` para el segundo, `fa-award` para el tercero, y múltiples iconos `fa-check` para enumerar los beneficios de cada posición. Las *bases del concurso* utilizan `fa-check-circle` para destacar cada regla importante. El *timeline del concurso* implementa iconos temáticos como `fa-calendar-check` para la fecha de inscripción, `fa-utensils` para la fase de cocina, `fa-balance-scale` para la evaluación y `fa-trophy` para el anuncio de ganadores. Los *testimonios* de ganadores anteriores se adornan con `fa-quote-left` para enfatizar visualmente las citas. Por último, el *footer* presenta iconos de redes sociales de la variante brands: `fa-google-plus-g`, `fa-facebook-f` y `fa-twitter`, facilitando el reconocimiento inmediato de los enlaces a las plataformas sociales del evento.

== Netlify Forms

Para la página de contenido libre (concurso), se implementó un formulario funcional utilizando *Netlify Forms*, una solución serverless que permite procesar formularios sin necesidad de desarrollar ni mantener un backend propio. Si bien esta funcionalidad constituía un requisito opcional de la práctica, se consideró que representaba un alto valor de aprendizaje, especialmente dado que en mi entorno profesional se está evaluando la adopción de esta tecnología para próximos proyectos. Por tanto, esta PEC brindó una excelente oportunidad para probar Netlify Forms en un contexto real y evaluar su viabilidad técnica. La principal ventaja de Netlify Forms radica en su integración automática con el proceso de deployment: simplemente añadiendo el atributo `data-netlify="true"` al elemento `<form>`, Netlify detecta, configura y procesa el formulario automáticamente, gestionando las submissions mediante su dashboard sin requerir configuración adicional de servidores o bases de datos. Esto permite crear aplicaciones web con funcionalidad de formularios completa manteniendo una arquitectura estática (JAMstack), lo cual resulta ideal para sitios como este donde no se justifica la complejidad de un backend tradicional.

=== Configuración del formulario

```html
<form
  name="contest"
  method="POST"
  data-netlify="true"
  netlify-honeypot="bot-field"
  class="contest-form needs-validation"
  novalidate
>
  <input type="hidden" name="bot-field" />
  <input type="hidden" name="form-name" value="contest" />
  <!-- Campos del formulario -->
</form>
```

=== Atributos clave

- `data-netlify="true"`: Activa el procesamiento de Netlify Forms, siendo el atributo principal que el sistema de build de Netlify busca automáticamente para identificar, configurar y habilitar el procesamiento del formulario sin necesidad de configuración adicional en el dashboard o archivos de configuración.
- `netlify-honeypot="bot-field"`: Implementa protección anti-spam mediante la técnica del honeypot, que consiste en un campo invisible para usuarios humanos pero que los bots automatizados suelen rellenar, permitiendo a Netlify filtrar automáticamente las submissions sospechosas sin requerir CAPTCHA ni afectar la experiencia del usuario.
- `name="contest"`: Define el identificador único del formulario que aparecerá en el dashboard de Netlify para distinguir las submissions de este formulario específico, especialmente útil cuando un sitio contiene múltiples formularios y se necesita identificar el origen de cada envío.
- `novalidate`: Desactiva la validación HTML5 nativa del navegador para prevenir la aparición de los mensajes de error predeterminados del browser, permitiendo así utilizar exclusivamente el sistema de validación y feedback visual personalizado de Bootstrap con sus clases `valid-feedback` e `invalid-feedback`.

=== Campos del formulario

1. Nombre completo (text, requerido)
2. Correo electrónico (email, requerido)
3. Teléfono (tel, requerido)
4. Nombre del plato (text, requerido)
5. Descripción de la receta (textarea, requerido)
6. Aceptación de términos (checkbox, requerido)


#figure(
  image("./images/form.jpg"),
  caption: [Formulario para inscribirse en el concurso implementado con Netlify Forms]
)

#figure(
  image("./images/submissions.jpg"),
  caption: [Dashboard de Netlify mostrando las submissions recibidas del formulario]
) <fig-submissions>

En la @fig-submissions se puede observar una captura del dashboard de Netlify donde se muestran las submissions recibidas del formulario implementado en la página de concurso.

= Decisiones de Diseño y Desarrollo

== Enfoque responsive

El proyecto adopta un enfoque híbrido que combina diseño desktop-first con implementación mobile-first.

=== Diseño conceptual: Desktop-first

Los wireframes proporcionados corresponden a la versión desktop del sitio, por lo que el diseño se conceptualizó inicialmente pensando en pantallas grandes.

=== Implementación CSS: Mobile-first

La implementación en código se realizó siguiendo el patrón *mobile-first*, escribiendo primero los estilos base para móviles y añadiendo media queries para pantallas más grandes:

```scss
// Estilos base (móvil)
.hero__title {
  font-size: clamp(1.75rem, 5vw, 3.5rem);
  max-width: 20ch;
}

// Tablet
@media (width >= 768px) {
  .hero__title {
    max-width: 25ch;
  }
}

// Desktop
@media (width >= 1024px) {
  .hero__title {
    font-size: 3.5rem;
  }
}
```

=== Justificación del enfoque mobile-first

1. *Override progresivo*: Es más fácil y natural hacer overrides hacia arriba (añadir complejidad) que hacia abajo
2. *Performance*: Los dispositivos móviles cargan menos CSS
3. *Priorización de contenido*: Obliga a pensar primero en el contenido esencial
4. *Especificidad*: Evita problemas de especificidad

=== Breakpoints definidos

```scss
$breakpoint-tablet: 768px;
$breakpoint-desktop: 1024px;
$breakpoint-desktop-l: 1440px;
```

== Estructura de páginas

El sitio consta de 4 páginas principales, cada una con características técnicas específicas.

=== 1. Página de inicio (`index.html`)

*Técnica principal*: CSS Grid con fallback `@supports`

```scss
// Fallback para navegadores sin soporte Grid
.hero {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  min-height: 100vh;
}

// Grid para navegadores modernos
@supports (display: grid) {
  .hero {
    display: grid;
    grid-template-columns: 1fr;
    grid-template-rows: auto;
    place-items: center;
  }
}
```

#figure(
  image("./images/home.jpg"),
  caption: [Captura de la página de inicio completa]
)

=== 2. Página de ponentes (`speakers.html`)

*Técnica principal*: Flexbox para grid responsive (sin clases `.row` o `.col-*` de Bootstrap)

Uno de los requisitos específicos de esta página era implementar el sistema de cuadrícula utilizando únicamente Flexbox, sin recurrir a las clases de grid predefinidas de Bootstrap (`.row` y `.col-*`). La implementación resultante genera un grid completamente responsivo que se adapta automáticamente mostrando 3 columnas en desktop, 2 columnas en tablet y 1 columna en dispositivos móviles, como se puede apreciar en las capturas siguientes:

#figure(
  image("./images/speakers-desktop.jpg"),
  caption: [Grid de ponentes en desktop con 3 columnas]
) <fig-speakers-desktop>

#figure(
  image("./images/speakers-tablet.jpg"),
  caption: [Grid de ponentes en tablet con 2 columnas]
) <fig-speakers-tablet>

#figure(
  image("./images/speakers-mobile.jpg"),
  caption: [Grid de ponentes en móvil con 1 columna]
) <fig-speakers-mobile>

=== 3. Página de artículo (`article.html`)

*Técnica principal*: Pseudoclases funcionales (`:has()`, `:is()`)

El requisito de esta página era utilizar pseudoclases funcionales modernas de CSS. Se implementaron dos de las tres disponibles:

- *`:has()`* permite seleccionar un elemento padre basándose en la existencia de determinados elementos hijos, cambiando la forma de aplicar estilos relacionales que anteriormente requerían JavaScript.

- *`:is()`* funciona como selector múltiple que agrupa varios selectores en uno solo, eliminando redundancia de código y mejorando la mantenibilidad.

- Aunque no se utilizó *`:where()`* en este proyecto, cabe mencionar que esta pseudoclase es funcionalmente idéntica a `:is()` pero con especificidad cero, lo que la hace especialmente útil para definir estilos base que necesitan ser fácilmente sobreescribibles sin aumentar la especificidad.

En las @fig-article-has y @fig-article-is se pueden observar ejemplos concretos de implementación de estas pseudoclases en el código del proyecto.

#figure(
  image("./images/article-has.jpg"),
  caption: [Uso en el cuerpo del artículo de la pseudoclase funcional `:has()`]
) <fig-article-has>

#figure(
  image("./images/article-is.jpg"),
  caption: [Uso en el cuerpo del artículo de la pseudoclase funcional `:is()`]
) <fig-article-is>

=== 4. Página de concurso (`contest.html`)

*Técnica principal*: Nuevas unidades y colores CSS modernos + Bootstrap + Netlify Forms

El requisito específico de esta página era utilizar las unidades y colores CSS modernos introducidos en el módulo 3 del curso. La implementación resultante hace uso extensivo de todas estas características, demostrando las capacidades más avanzadas de CSS moderno para crear interfaces adaptativas, fluidas y visualmente sofisticadas.

==== Unidades CSS modernas implementadas

*Dynamic Viewport Height (`dvh`)*: A diferencia de la unidad tradicional `vh` que es estática, `dvh` se adapta dinámicamente cuando las barras de navegación del navegador móvil se muestran u ocultan, garantizando que el hero section ocupe siempre la altura visible correcta. Se utilizó en 5 ubicaciones estratégicas del diseño.

*Container Query Units (`cqw`, `cqh`)*: Estas unidades permiten dimensionar elementos relativos al tamaño de su contenedor en lugar del viewport, facilitando componentes verdaderamente modulares. La página implementa varios usos de estas unidades para tipografía adaptativa, permitiendo que los tamaños de fuente escalen proporcionalmente al contenedor. Ejemplo: `font-size: clamp(var(--font-size-2xl), 5cqw, var(--font-size-5xl))` hace que el título del hero se adapte al ancho de su contenedor.

*Line Height Unit (`lh`)*: Esta unidad relativa al line-height calculado del elemento facilita la creación de espaciados que respetan el ritmo vertical tipográfico. Se emplea para márgenes y paddings, como en `margin-block-end: calc(1lh * 0.5)`, garantizando espaciados armónicos que se adaptan automáticamente cuando cambia el line-height.

*Character Width Unit (`ch`)*: Basada en el ancho del carácter "0" de la fuente actual, permite limitar anchos de texto para mantener buena legibilidad. Se utiliza para establecer `max-inline-size: 70ch`, manteniendo líneas de texto en el rango óptimo de lectura (45-75 caracteres).

*Función `clamp()`*: Esta función define valores que escalan entre un mínimo y un máximo con un valor preferido. Se implementó en bastantes lugates para tipografía fluida, espaciados adaptativos y dimensiones responsivas, eliminando la necesidad de múltiples media queries. Ejemplo: `padding-block: clamp(4rem, 10vh, 6rem)` crea espaciado que crece proporcionalmente pero nunca excede los límites establecidos.

*Propiedades lógicas*: En lugar de propiedades físicas (`width`, `height`, `margin-left`), se utilizaron propiedades lógicas (`inline-size`, `block-size`, `margin-inline-start`) en todo el archivo. Estas propiedades se adaptan automáticamente a la dirección del texto (LTR/RTL) y al modo de escritura, haciendo el código internacionalmente compatible sin modificaciones.

==== Colores CSS modernos implementados

*`color-mix()` con espacio de color `oklab`*: Esta función permite mezclar colores en espacios de color perceptualmente uniformes. Se implementó para crear variaciones de color naturales, sombras adaptativas y overlays semitransparentes. El espacio de color `oklab` produce mezclas visualmente más naturales que RGB o HSL, evitando los tonos grises indeseados en gradientes. Ejemplo: `color-mix(in oklab, var(--color-primary) 90%, transparent)` crea una versión semitransparente del color primario que se mezcla naturalmente con el fondo.

*Sintaxis `rgb()` con `from` (colores relativos)*: Esta nueva sintaxis permite crear variaciones de un color existente modificando solo ciertos componentes. Se utilizó para generar overlays y sombras adaptativas: `rgb(from var(--color-black) r g b / 30%)` toma el color negro y ajusta solo su opacidad al 30%, manteniendo los componentes RGB originales.

*Gradientes con `color-mix()`*: Los gradientes lineales combinan ambas técnicas, usando `color-mix()` con `oklab` para crear transiciones de color suaves y perceptualmente uniformes entre los colores temáticos del sitio, como se puede apreciar en la @fig-oklab-gradient. Esta técnica elimina las "zonas grises" que aparecen en gradientes RGB tradicionales.

==== Ejemplo de implementación

El hero section de la página de concurso ejemplifica la convergencia de estas técnicas modernas:

```scss
.contest-hero {
  min-block-size: clamp(40dvh, 50dvh, 60dvh);
  padding-block: clamp(4rem, 10vh, 6rem);
  background: linear-gradient(
    135deg,
    color-mix(in oklab, var(--color-primary) 90%, transparent),
    color-mix(in oklab, var(--color-secondary) 85%, transparent)
  );
}

.contest-hero__title {
  font-size: clamp(var(--font-size-2xl), 5cqw, var(--font-size-5xl));
  margin-block-end: calc(1lh * 0.5);
}
```

Este código combina unidades dinámicas (`dvh`), funciones fluidas (`clamp()`), propiedades lógicas (`block-size`, `padding-block`), unidades de contenedor (`cqw`), unidades de line-height (`lh`) y colores modernos (`color-mix` con `oklab`), demostrando el poder expresivo del CSS moderno.

#figure(
  image("./images/oklab-gradient.jpg"),
  caption: [Gradiente del hero implementado con `color-mix()` y `oklab`]
) <fig-oklab-gradient>

#figure(
  image("./images/margin-block-end.jpg"),
  caption: [Uso de propiedades lógicas y unidad `lh` en espaciados]
) <fig-margin-block>

= Características CSS Avanzadas

En la sección anterior donde se detalla cómo se ha implementado cada página, ya hemos comentado el uso de características avanzadas como `has()`, `is()`, unidades modernas y `color-mix()`. A continuación, se detallan otras técnicas usadas que cabe mencionar.

== Container Queries

Las Container Queries representan una evolución fundamental en el diseño responsivo de componentes web. Tradicionalmente, las media queries solo permitían adaptar estilos basándose en las dimensiones del viewport completo, lo que creaba una dependencia implícita entre los componentes y el layout global de la página. Las container queries rompen esta limitación permitiendo que los componentes respondan al tamaño de su contenedor padre directo en lugar del viewport, facilitando la creación de componentes verdaderamente modulares que se adaptan automáticamente a cualquier contexto en el que se coloquen.

=== Implementación técnica

La declaración de una container query requiere dos pasos. Primero, se define el contenedor mediante `container-type` (que puede ser `inline-size` para ancho, `block-size` para alto, o `size` para ambos) y opcionalmente un `container-name` para referenciarlo específicamente. Segundo, se utilizan reglas `@container` similares a las media queries para aplicar estilos cuando el contenedor cumple ciertas condiciones de tamaño.

```scss
.speaker-card {
  container-type: inline-size;
  container-name: speaker-card;

  @container speaker-card (min-width: 250px) {
    .speaker-card__name {
      font-size: var(--font-size-xl);
    }
  }
}
```

En este ejemplo, cada tarjeta de ponente se convierte en un contexto de contención (`container-type: inline-size`), monitorizando su propio ancho. Cuando el ancho de una tarjeta individual supera 250px, el nombre del ponente aumenta de tamaño automáticamente. Esto significa que tarjetas en layouts de 1, 2 o 3 columnas se adaptarán independientemente según su espacio disponible real, no según el ancho del viewport global.

=== Implementación en el proyecto

El proyecto implementa 11 container queries distribuidas entre las 4 páginas: la página de inicio utiliza container queries en el hero section, la página de ponentes las emplea en el contenedor de tarjetas y en cada tarjeta individual, la página de artículo las aplica en el contenedor principal, y la página de concurso las utiliza en el formulario y las tarjetas de premios. Esta distribución demuestra cómo los container queries pueden aplicarse a diferentes tipos de componentes (heroes, tarjetas, formularios) para conseguir adaptabilidad contextual.

=== Ventajas sobre media queries tradicionales

*Independencia del layout global*: Los componentes no necesitan "conocer" si están en una sidebar, en el contenido principal, o en un modal. Se adaptan automáticamente basándose en su espacio disponible real, no en suposiciones sobre el viewport.

*Reutilización sin modificaciones*: Un mismo componente puede colocarse en diferentes contextos (layout de 1 columna, 2 columnas, 3 columnas) y funcionará correctamente en todos ellos sin necesidad de variantes específicas o clases modificadoras adicionales.

*Mantenibilidad mejorada*: La lógica responsive está encapsulada dentro del propio componente, no dispersa en múltiples media queries globales. Esto facilita la comprensión, el testing y la modificación del comportamiento adaptativo del componente.

== Cascade Layers

Las Cascade Layers (`@layer`) permiten controlar explícitamente el orden de aplicación de los estilos.

=== Implementación

```scss
@layer framework, base, layout, modules, state, theme;

@layer framework {
  @import "dependencies";  // Bootstrap
}

@layer base {
  @import "base/reset";
  @import "base/colors";
  // ...
}

@layer modules {
  @import "modules/header";
  @import "modules/footer";
  // ...
}
```

=== Orden de prioridad

1. framework ← Menor prioridad (Bootstrap)
2. base
3. layout
4. modules
5. state
6. theme ← Mayor prioridad

*Ventaja clave*: Bootstrap está en la capa `framework`, garantizando que nuestros estilos personalizados tengan precedencia sin necesidad de aumentar especificidad o usar `!important`.

== Característica adicional: Light/Dark Mode

=== Motivación y justificación

Aunque el sistema de light/dark mode no constituía un requisito obligatorio de la práctica, se decidió implementarlo como característica adicional con múltiples objetivos de aprendizaje. En primer lugar, representaba una excelente oportunidad para explorar y experimentar con las nuevas funciones de color CSS, particularmente `color-mix()` y los espacios de color modernos como `oklab`, aplicándolas en un contexto práctico más complejo que requiere variaciones adaptativas de colores. En segundo lugar, la implementación de un sistema de temas permite demostrar el dominio de variables CSS en escenarios dinámicos y comprobar cómo las propiedades personalizadas pueden transformar completamente la apariencia visual del sitio mediante cambios mínimos en el código. Por último, considerar la preferencia del usuario mediante la media query `prefers-color-scheme` constituye una buena práctica de accesibilidad y experiencia de usuario que mejora sustancialmente la calidad del proyecto.

=== Desafíos técnicos superados

El principal desafío consistió en mantener ratios de contraste WCAG AA (mínimo 4.5:1 para texto normal) en ambos modos, requiriendo ajustes iterativos de sombras, overlays, bordes y gradientes, donde el uso de `color-mix()` con transparencias relativas permitió que muchos elementos se adaptaran automáticamente sin reglas específicas para modo oscuro. En las @fig-article-dark y @fig-article-light se puede observar la comparación visual de ambos modos, demostrando cómo el sistema adapta colores y elementos visuales manteniendo jerarquía y legibilidad.

#figure(
  image("./images/article-dark.jpg"),
  caption: [Página de artículo en modo oscuro con variables CSS adaptadas]
) <fig-article-dark>

#figure(
  image("./images/article-light.jpg"),
  caption: [Página de artículo en modo claro (configuración predeterminada)]
) <fig-article-light>

= Características SASS

En este apartado se detallan las características avanzadas de Sass utilizadas en el proyecto.

== Variables

=== Variables de Bootstrap

Se han declarado variables personalizadas en sintonía con las propidades CSS que mantienen la paleta de colores del proyecto. Estas variables se usan pricipalemente para sobrescribir las variables de Bootstrap y adaptar los componentes del framework a la identidad visual del sitio.

```scss
$canary-red: #c9302c;
$canary-yellow: #f4c430;
$canary-green: #6b9b7f;

$theme-colors: (
  "primary": $canary-red,
  "secondary": $canary-yellow,
  "success": $canary-green,
);
```

=== Variables del proyecto

```scss
$breakpoint-tablet: 768px;
$breakpoint-desktop: 1024px;
$breakpoint-desktop-l: 1440px;
```

== Anidación

Como se vio ya en la PEC anterior, Sass permite anidar selectores dentro de otros para reflejar la jerarquía del HTML y mejorar la legibilidad del código. En esta PEC también se ha hecho uso extensivo de esta característica.

```scss
.speaker-card {
  container-type: inline-size;
  container-name: speaker-card;

  &__image {
    width: 100%;
    height: auto;
  }

  &__body {
    padding: var(--spacing-md);
  }

  &__name {
    margin-bottom: var(--spacing-sm);
    font-weight: 700;
  }
}
```

== Funciones y Mixins

Se han creado algunas funciones y mixins personalizados orientadas a distintas utilidades para reutilizar código y facilitar la mantenibilidad.

=== Mixins responsive

```scss
$breakpoint-tablet: 768px;
$breakpoint-desktop: 1024px;

@mixin respond-to-tablet {
  @media (min-width: $breakpoint-tablet) {
    @content;
  }
}

@mixin respond-to-desktop {
  @media (min-width: $breakpoint-desktop) {
    @content;
  }
}
```

=== Uso de los mixins

```scss
.article-content {
  padding: var(--spacing-xl) var(--spacing-md);

  @include respond-to-tablet {
    padding: var(--spacing-2xl) var(--spacing-lg);
  }

  @include respond-to-desktop {
    padding: var(--spacing-3xl) var(--spacing-xl);
  }
}
```

== Parciales e Importación

Como se vio en el apartado de Estructura de Archivos, el código Sass se ha organizado en múltiples parciales siguiendo la metodología SMACSS. Estos parciales se importan en un archivo principal `main.scss` que luego es compilado a CSS.

=== Uso de `@use` (Sass moderno)

```scss
@use '../base/responsive' as *;

.component {
  @include respond-to-tablet {
    // ...
  }
}
```

= Compilación y Publicación

Una vez finalizado el desarrollo, el proyecto se compiló para producción utilizando el comando `npm run build`, que ejecuta el empaquetador Parcel con todas sus optimizaciones automáticas. Este compila todos los archivos HTML, Sass y JavaScript aplicando el pipeline de PostCSS (que incluye autoprefixer para compatibilidad cross-browser y preset-env para transpilar características CSS modernas con fallbacks automáticos), y finalmente genera los archivos optimizados: CSS y JavaScript minificados con tree shaking (eliminación de código no utilizado), imágenes comprimidas mediante Sharp, y archivos con hashes en sus nombres para facilitar el cache-busting en navegadores.

Con los archivos compilados listos, el código fuente completo del proyecto se publicó en un repositorio público de GitHub (#link("https://github.com/DanielRamosAcosta/hhyc2-pec2")), que incluye el código fuente en `src/`, la configuración del entorno de desarrollo, los wireframes proporcionados para el diseño, y esta documentación.

A continuación, se procedió a conectar el repositorio de GitHub con Netlify para realizar el deployment del sitio web. Netlify se configuró para realizar deployments continuos: cada vez que se realiza un push a la rama `main` del repositorio, Netlify automáticamente ejecuta el comando de build (`npm run build`) en sus servidores, publica el contenido del directorio `dist/` resultante, y lo hace accesible a través de la URL #link("https://dra-hhyc2-pec2.netlify.app/"). Esta configuración de deployment continuo garantiza que la versión en producción siempre refleja el último código confirmado en el repositorio, simplificando significativamente el proceso de publicación de cambios.

Finalmente, se verificó el correcto funcionamiento del sitio desplegado accediendo a la URL de Netlify y comprobando que todas las páginas cargaban correctamente, los estilos se aplicaban como esperado, el formulario de Netlify Forms estaba operativo, y todos los componentes responsive funcionaban en diferentes tamaños de viewport. La @fig-home-with-url muestra la página de inicio correctamente desplegada en Netlify con la URL visible en el navegador, confirmando el éxito del proceso de deployment.

#figure(
  image("./images/home-with-url.jpg"),
  caption: [Página de inicio desplegada en Netlify con la URL visible en el navegador]
) <fig-home-with-url>

= Enlaces

== Repositorio GitHub

#link("https://github.com/DanielRamosAcosta/hhyc2-pec2")

El repositorio contiene:
- Código fuente completo en `src/`
- Configuración de desarrollo
- Wireframes del proyecto
- Documentación

== Sitio publicado en Netlify

#link("https://dra-hhyc2-pec2.netlify.app/")

El sitio incluye:
- 4 páginas principales (inicio, ponentes, artículo, concurso)
- Diseño responsive
- Formulario funcional con Netlify Forms
- Todas las características CSS avanzadas implementadas

= Recursos y Licencias

== Imágenes

=== Imágenes de ponentes

Todas las imágenes provienen de *Wikimedia Commons* bajo licencia *CC BY-SA 4.0*:

- Pepe Benavente, Bejo, Quevedo

Esta licencia permite tanto el uso comercial como la modificación de las imágenes, pero establece dos requisitos obligatorios: se debe proporcionar atribución al autor original de cada fotografía, y cualquier obra derivada debe distribuirse bajo la misma licencia CC BY-SA 4.0, garantizando así que las modificaciones permanezcan en el dominio de contenido libre.

== Uso de Inteligencia Artificial

La normativa académica de la UOC establece la obligatoriedad de especificar el uso de inteligencia artificial en proyectos académicos, promoviendo así la transparencia en el proceso de aprendizaje y la honestidad intelectual. En cumplimiento de esta directriz, se detallan a continuación los ámbitos específicos en los que se han empleado herramientas de IA generativa durante el desarrollo de este proyecto.

Se ha utilizado inteligencia artificial para tres propósitos específicos: *generación de contenido textual* en secciones del sitio web que requieren estilo de redacción marketing (como descripciones de eventos, biografías de ponentes y textos promocionales), aplicando posteriormente revisión humana para asegurar coherencia y precisión; *modificación y generación de imágenes* mediante Gemini para evitar dependencias de recursos con restricciones de copyright, garantizando así la libertad de distribución del proyecto; y *proofreading y corrección gramatical* de esta memoria técnica, mejorando la claridad y consistencia del lenguaje académico sin alterar el contenido técnico ni las conclusiones del trabajo.

Es importante precisar que la inteligencia artificial *no se ha empleado* para la escritura de código HTML, CSS o JavaScript, ni para el diseño de la arquitectura del proyecto, ni para la resolución de problemas técnicos de implementación. Todo el código fuente, la configuración del entorno de desarrollo, las decisiones arquitectónicas (elección de SMACSS, estructura de archivos, uso de Cascade Layers) y la implementación de características CSS avanzadas (Container Queries, pseudoclases funcionales, color-mix con oklab) son resultado exclusivo del trabajo personal de investigación, aprendizaje y desarrollo técnico.

= Conclusiones

Este proyecto ha permitido poner en práctica y consolidar conocimientos avanzados de HTML, CSS y Sass, explorando características modernas del lenguaje y metodologías de organización de código.

== Aprendizajes clave

- *Metodología SMACSS + Cascade Layers*: La combinación de SMACSS con `@layer` CSS ha demostrado ser extremadamente efectiva. SMACSS proporciona la estructura de archivos y la filosofía organizativa, mientras que `@layer` ofrece el control técnico sobre el orden de aplicación de la cascada. Esta integración natural entre metodología y especificación CSS moderna facilita la creación de código predecible, mantenible y con jerarquías de especificidad claras sin recurrir a soluciones artificiales como `!important`.

- *Container Queries como cambio de paradigma*: Las container queries han transformado completamente la forma de pensar sobre componentes responsive. Los componentes dejan de depender del viewport global y se vuelven verdaderamente modulares y reutilizables, adaptándose automáticamente al espacio disponible en su contenedor sin necesidad de conocer el contexto del layout. Esta encapsulación de la lógica responsive dentro del propio componente mejora significativamente la mantenibilidad y facilita la reutilización en diferentes contextos sin modificaciones.

- *Pseudoclases funcionales para CSS más expresivo*: Las pseudoclases `:has()` y `:is()` permiten escribir selectores que históricamente requerían JavaScript para su implementación. `:has()` habilita la selección relacional padre-hijo de forma nativa en CSS, mientras que `:is()` agrupa selectores eliminando redundancia de código. Estas capacidades reducen el acoplamiento entre HTML, CSS y JavaScript, producen código más declarativo y auto-documentado, y mejoran el rendimiento al evitar la manipulación del DOM mediante scripts.

- *Light/Dark Mode con variables CSS y color-mix()*: La implementación del sistema de temas constituyó el mayor desafío técnico del proyecto, pero también el aprendizaje más valioso sobre colores CSS modernos. Las variables CSS (`custom properties`) permiten cambios dinámicos de tema mediante la redefinición de valores en media queries como `prefers-color-scheme`, mientras que `color-mix()` con el espacio de color `oklab` facilita la creación de variaciones adaptativas que funcionan naturalmente en ambos modos, produciendo mezclas perceptualmente uniformes que superan las limitaciones de RGB y HSL.
