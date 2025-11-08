# Enunciado P2

**Presentación**

En lo que llevamos de curso hemos trabajado en un entorno de desarrollo moderno, conoces las nuevas tendencias en CSS, sabes usar librerías externas, y dispones de herramientas que te ayudan a desarrollar sitios web. ¡En esta PEC llega la hora de demostrar y poner en práctica todos estos conocimientos adquiridos! Se propone un reto de desarrollo de un sitio web, partiendo de [UOC Boilerplate](https://github.com/uoc-advanced-html-css/uoc-boilerplate/).  El encargo tiene unos requisitos mínimos que se definen en el apartado de Descripción. Todo el proceso que sigas deberá de estar documentado, y deberás entregar exactamente lo que se pide en el apartado de Formato y fecha de entrega para poder ser evaluado.

El peso de esta PEC es de un **50%** de la nota de la evaluación continua.

**Objetivos**

- Diseñar y ejecutar un pequeño sitio web *responsive*.
- Utilizar un *workflow* de desarrollo frontend moderno, partiendo de UOC Boilerplate.
- Utilizar el lenguaje de preprocesado de estilos Sass.
- Elegir criterios de desarrollo (metodologías y guías de estilo) adecuados para el tipo de encargo.
- Configurar y usar correctamente Stylelint en función de los criterios elegidos.
- Utilizar las técnicas de maquetado CSS flex y grid.
- Utilizar la librería de componentes Bootstrap.
- Utilizar las pseudoclases funcionales, container queries, nuevas unidades y colores, y capas de cascada.
- Documentar el proceso de elección y aplicación de los criterios elegidos, así como el propio proceso de desarrollo.
- Publicar el repositorio en GitHub y realizar un deployment en Netlify.

**Descripción**

Unos amigos y tu colaboráis con el ayuntamiento en la organización de unas jornadas sobre cocina tradicional. Las jornadas contarán con charlas por parte de varios ponentes, además de talleres y cursos orientados a la cocina tradicional. Cada uno aporta su granito de arena y a ti te ha tocado realizar la página web. La última vez que os reunisteis, elaboraste rápidamente unos [wireframes](https://aula.uoc.edu/courses/60835/files/8633887?verifier=ji2jfwXwCMPNbACL1VAhnnha93wSFu2IcRJ0ctgS&wrap=1) [Download wireframes](https://aula.uoc.edu/courses/60835/files/8633887/download?verifier=ji2jfwXwCMPNbACL1VAhnnha93wSFu2IcRJ0ctgS&download_frd=1) sobre la estructura y los contenidos básicos del sitio web.

Esta PEC consta de dos partes, que se configuran básicamente en desarrollo y documentación. Es necesario realizar y entregar ambas partes de la PEC para poder ser evaluado.

En la parte de **desarrollo**, deberás elaborar **un sitio web** que siga las características que se especifican a continuación:

- El sitio web debe tener cuatro páginas (página de portada y tres páginas interiores), siguiendo los [wireframes](https://aula.uoc.edu/courses/60835/files/8633887?verifier=ji2jfwXwCMPNbACL1VAhnnha93wSFu2IcRJ0ctgS&wrap=1) [Download wireframes](https://aula.uoc.edu/courses/60835/files/8633887/download?verifier=ji2jfwXwCMPNbACL1VAhnnha93wSFu2IcRJ0ctgS&download_frd=1) proporcionados. La temática del sitio web debe ser información sobre las jornadas que organizáis. Toda la información que no se proporciona con el enunciado, así como la línea gráfica, la puedes decidir tú según tus gustos o te convenga. Debes seguir estas directrices sobre cada página:

- La página de portada: debe estar maquetada con CSS Grid y debes realizar algún diseño interesante, parecido a lo que podría ser un póster promocional de las jornadas. Como punto de partida, puedes leer el artículo “[How I design with CSS Grid](https://www.chenhuijing.com/blog/how-i-design-with-css-grid)” de Chen Hui Jing, en el que cuenta cómo realizar una página de portada en formato póster. También te puedes inspirar con los [vídeos de la Jen Simmons en su canal Layout Land](https://www.youtube.com/playlist?list=PLbSquHt1VCf2irEuVf8c2hsoOMKyeQ2LO). La maquetación que realices debe ser compatible con navegadores que no soporten CSS Grid, usando @supports y ofreciendo una versión alternativa, como se explica en la guía del módulo 3.2. Debes alcanzar los objetivos propuestos, pero no tienes que ser demasiado creativo o perder muchísimo tiempo en este apartado.
- Una de las páginas interiores debe incluir una retícula con información sobre los participantes en las jornadas, maquetada con flex. Para esta retícula, no puedes usar las clases de Bootstrap .row o .col-\*.
- Una de las páginas interiores debe seguir un formato de artículo e incluir un mínimo de 4 párrafos de texto y 2 fotografías. Puede ser una página que contenga información genérica sobre las jornadas que organizáis, una página del estilo noticia o nota de prensa, o cualquier otra opción que cumpla los requisitos descritos. A parte de la maquetación de la página deberás aplicar estilos a algunos elementos HTML que habitualmente podrían formar parte de una página de este tipo, como blockquote o listas (como se puede ver en el wireframe). Además, en esta página deberás utilizar correctamente y con criterio la pseudoclase funcional :has() y al menos una de estas dos: :is() o :where().
- La tercera página interior es de contenido completamente libre. La puedes usar para enseñar cualquier cosa que sepas hacer o que hayas aprendido. Algunas ideas son: una página de contacto con un formulario funcional (puede ser interesante probar [Netlify Forms](https://www.netlify.com/products/forms)), una galería de fotos interactiva, un juego, vídeos… En esta página debes utilizar las nuevas unidades y colores que se exponen en el módulo 3.

- El sitio web debe ser responsive y se debe poder ver correctamente desde cualquier dispositivo moderno (teléfono, tablet, ordenador…). En la reunión solo te dio tiempo de elaborar los wireframes de la versión de escritorio, así que deberás pensar cómo adaptas a dispositivos más pequeños la estructura acordada.
- Debes partir de [UOC Boilerplate](https://github.com/uoc-advanced-html-css/uoc-boilerplate/) para tu desarrollo. Asegúrate de estar usando la última versión (en el momento de escribir este enunciado, la última versión es la 3.12.0). Debes respetar la estructura y nomenclatura de carpetas y ficheros (¡a menos que la metodología o guía de estilo escogida indique lo contrario!). Tienes toda la información sobre la instalación y uso en la guía de estilo del módulo 1.
- Debes escoger una o más de las metodologías y guías de estilo estudiadas en el módulo 2 y aplicarla en tu desarrollo.
- Debes usar Bootstrap 5, cargado en UOC Boilerplate y personalizado con Sass como se indica en los materiales, y usar un mínimo de 4 componentes distintos. Debes personalizar algún parámetro de los componentes usados a través de variables Sass, como se explica en la sección Customize de la documentación de Bootstrap.
- Debes utilizar container queries en las 4 páginas. Además, tienes que utilizar de manera coherente capas de cascada en dos de las 4 páginas.
- A parte, debes incorporar y usar otra dependencia externa, como FontAwesome o cualquier otra que consideres interesante. Puede ser una buena idea para la página de contenido libre. Puedes explicar en el foro cuál es, por qué la escogiste, y si tienes alguna duda o incidencia con su uso.
- Además de esta dependencia, debes instalar Stylelint y personalizar su configuración para que aplique los criterios de estilos elegidos, con plugins y reglas. Cuando ejecutes la orden para validarlo no debe aparecer ningún error.
- Debes usar necesariamente las siguientes características de Sass: variables, anidado, funciones, parciales e importación.
- Una vez finalizado el desarrollo, deberás publicar el código en GitHub y realizar un deployment en Netlify, como se explica en la guía del módulo 1.

A parte de estos requisitos mínimos, puedes ampliar tu proyecto como lo creas oportuno.

El código que entregues deberá estar compilado para producción con el comando npm run build.

En la parte de **documentación**:

- - Deberás documentar todo el proceso de desarrollo de esta práctica (descargar/clonar el repositorio, instalar dependencias, el entorno de desarrollo, la compilación para producción, la publicación, etc), explicando los pasos que seguiste y los resultados obtenidos.
  - Deberás justificar la elección de metodología y/o guía de estilo en base al tipo de encargo, tus conocimientos, la metodología de desarrollo aplicada y la avenencia de los conceptos estudiados con el proyecto y tu estilo de código. Deberás explicar detalladamente cómo aplicaste los criterios escogidos a tu código, así como la configuración que realizaste en Stylelint para que se aplicaran estos criterios.
  - Debes explicar qué dependencias instalaste y cómo las usaste y personalizaste. En el caso de Bootstrap, debes especificar qué variables usaste para personalizar los componentes.
  - Deberás explicar cualquier decisión de diseño y desarrollo que tomaras (por ejemplo: qué dependencias añadiste, si en tus hojas de estilo seguiste una aproximación *desktop first* o _mobile firs_t, …).
  - Deberás incluir de forma clara los enlaces al repositorio de GitHub y la URL pública de Netlify.

**Criterios de evaluación**

- Desarrollo (70%)
  - Uso correcto de UOC Boilerplate y dependencias externas (5%)
  - HTML/Sass (5%)
  - Uso de Bootstrap (5%)
  - Uso de Flex (5%)
  - Uso de Grid y @supports (5%)
  - Página interior con formato de artículo. Uso de pseudoclases funcionales (10%)
  - Página de contenido libre con las nuevas unidades y colores (10%)
  - Uso de container queries y capas de cascada (5%)
  - Diseño y *responsiveness* (5%)
  - Aplicación de metodologías y guías de estilo, adecuación a estándares y calidad del código en general (5%)
  - Configuración y aplicación Stylelint (5%)
  - Publicación de repositorio y deployment (5%)
- Documentación (30%)
  - Documentación del proceso de desarrollo (10%)
  - Justificación del uso de las pseudoclases funcionales y las capas de cascada. Explicación de las container queries utilizadas (5%)
  - Justificación de las decisiones tomadas en el desarrollo, dependencias instaladas y personalización, problemas resueltos… (10%)
  - Justificación de la elección de la metodología y/o guía de estilo y descripción de la aplicación de los criterios elegidos (5%)

**Formato y fecha de entrega**

La parte de **desarrollo** se debe **entregar** en una carpeta que contenga todos los ficheros del proyecto desarrollado, incluyendo la carpeta dist/ correctamente compilada para producción, la carpeta src/ con el código fuente desarrollado, y los ficheros de configuración que hay en la raíz del proyecto (atención, porque según vuestro entorno pueden ser ficheros ocultos, ¡aseguraos de incluirlos!). **No debéis incluir la carpeta** **node_modules**, ya que las dependencias de desarrollo cambian según el entorno. Cualquier entrega que contenga la carpeta node_modules será **rechazada**.

Se debe **entregar** la parte de **documentación** en un documento de texto en formato estándar, preferiblemente .pdf. Evita, a poder ser, formatos propietarios como .doc o .pages.

**Se deberán entregar ambas partes dentro de un solo fichero comprimido** en formato .zip o .rar, con vuestro nombre e indicando que se trata de la PEC 2, **a través de la actividad denominada "Entrega P2"**. No se admitirán entregas por ningún otro canal.

La fecha límite de entrega es el **domingo 7 de diciembre de 2025 a las 23.59 h**.

**Propiedad intelectual y plagio**

A menudo es inevitable, al producir una obra multimedia, usar recursos creados por terceras personas. Es por lo tanto comprensible hacerlo en el marco de una práctica de este máster, siempre que esto se documente claramente y no suponga un plagio en la práctica.

Por lo tanto, al presentar una práctica que haga uso de recursos ajenos, se debe presentar junto a ella un documento en que se detallen todos estos recursos, especificando su nombre, autor, lugar donde se obtuvo y su estatus legal: si la obra está protegida por el copyright o se acoge a alguna otra licencia de uso (Creative Commons, llicència GNU, GPL ...). El estudiante deberá asegurarse que la licencia que sea no impida específicamente su uso en el marco de la práctica. En caso de no encontrar la información correspondiente, se deberá asumir que la obra está protegida por el copyright.

Además, se deberán adjuntar los ficheros originales cuando las obras utilizadas sean digitales, y su código fuente si corresponde.

**Plagio**

A menos que se especifique en el enunciado, las pruebas de evaluación continua y las prácticas se deben realizar de forma individual. En caso de detectar actividades plagiadas, todas ellas serán calificadas con una nota de D.
