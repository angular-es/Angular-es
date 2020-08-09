# Configurar el entorno y el espacio de trabajo locales

Esta guía explica cómo configurar su entorno para el desarrollo de Angular usando la [herramienta CLI de Angular](cli "CLI command reference").
Incluye información sobre los requisitos previos, la instalación de la CLI, la creación de un espacio de trabajo inicial y una aplicación de inicio, y la ejecución de esa aplicación localmente para verificar su configuración.


<div class="callout is-helpful">
<header>Prueba Angular sin configuración local</header>

Si es nuevo en Angular, es posible que desee comenzar con [¡Pruébelo ahora!](start), que presenta los aspectos esenciales de Angular en el contexto de una aplicación de tienda en línea básica lista para usar que puede examinar y modificar. Este tutorial independiente aprovecha el [StackBlitz](https://stackblitz.com/) entorno interactivo para el desarrollo online. No es necesario que configure su entorno local hasta que esté listo.

</div>


{@a devenv}
{@a prerequisites}
## Requisitos previos

Para usar el marco Angular, debe estar familiarizado con lo siguiente:

* [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript/A_re-introduction_to_JavaScript)
* [HTML](https://developer.mozilla.org/docs/Learn/HTML/Introduction_to_HTML)
* [CSS](https://developer.mozilla.org/docs/Learn/CSS/First_steps)

El conocimiento de [TypeScript](https://www.typescriptlang.org/) es útil, pero no obligatorio.

Para instalar Angular en su sistema local, necesita lo siguiente:

{@a nodejs}

* **Node.js**
  
  Angular requiere un [LTS actual, activo o de mantenimiento](https://nodejs.org/about/releases) versión de Node.js.

  <div class="alert is-helpful">

  Para obtener información sobre los requisitos específicos de la versión, consulte el archivo de clave de "motores" en [package.json](https://unpkg.com/@angular/cli/package.json).

  </div>

  Para obtener más información sobre la instalación de Node.js, consulte [nodejs.org](http://nodejs.org "Nodejs.org").
   Si no está seguro de qué versión de Node.js se ejecuta en su sistema, ejecute `node -v` en una ventana de terminal.

{@a npm}

* **administrador de paquetes npm**

   Las aplicaciones Angular, Angular CLI y Angular dependen de [paquetes npm](https://docs.npmjs.com/getting-started/what-is-npm) para muchas características y funciones.
   Para descargar e instalar paquetes npm, necesita un administrador de paquetes npm.
   Esta guía utiliza la interfaz de línea de comandos [cliente npm](https://docs.npmjs.com/cli/install), que se instala con `Node.js` de forma predeterminada.
   Para comprobar que tiene instalado el cliente npm, ejecute `npm -v` en una ventana de terminal.


{@a install-cli}

## Instala la CLI de Angular

Utiliza la CLI de Angular para crear proyectos, generar código de aplicaciones y bibliotecas y realizar una variedad de tareas de desarrollo en curso, como pruebas, agrupación e implementación.

Para instalar la CLI angular, abra una ventana de terminal y ejecute el siguiente comando:

<code-example language="sh" class="code-shell">
  npm install -g @angular/cli
</code-example>

{@a create-proj}

## Crea un espacio de trabajo y una aplicación inicial

Desarrolla aplicaciones en el contexto de un [**espacio de trabajo**](guide/glossary#workspace) angular.

Para crear un nuevo espacio de trabajo y una aplicación de inicio inicial:

1. Ejecute el comando CLI `ng new` y proporcione el nombre `my-app`, como se muestra aquí:

    <code-example language="sh" class="code-shell">
      ng new my-app

    </code-example>

2. El comando `ng new` le solicita información sobre las funciones que debe incluir en la aplicación inicial. Acepte los valores predeterminados presionando la tecla Intro o Retorno.

Angular CLI instala los paquetes Angular npm necesarios y otras dependencias. Esto puede tardar unos minutos.

La CLI crea un nuevo espacio de trabajo y una aplicación de bienvenida simple, lista para ejecutarse.

<div class="alert is-helpful">

También tiene la opción de usar el modo estricto angular, que puede ayudarlo a escribir un código mejor y más fácil de mantener.
Para obtener más información, consulte [Modo estricto](/guide/strict-mode).

</div>

{@a serve}

## Ejecuta la aplicación

La CLI de Angular incluye un servidor, de modo que puede construir y servir su aplicación localmente.

1. Navegue a la carpeta del área de trabajo, como "my-app".

1. Ejecute el siguiente comando:

<code-example language="sh" class="code-shell">
  cd my-app
  ng serve --open
</code-example>

El comando `ng serve` inicia el servidor, observa sus archivos,
y reconstruye la aplicación a medida que realiza cambios en esos archivos.

La opción `--open` (o simplemente`-o`) abre automáticamente su navegador
a `http://localhost:4200/`.

Si su instalación y configuración fue exitosa, debería ver una página similar a la siguiente.


<div class="lightbox">
  <img src='generated/images/guide/setup-local/app-works.png' alt="Welcome to my-app!">
</div>


## Próximos pasos

* Para obtener una introducción más completa a los conceptos fundamentales y la terminología de la arquitectura de aplicaciones de una sola página y los principios de diseño de Angular, lea la sección [Conceptos de Angular](guide/architecture).

* Trabaje con el [Tutorial Tour of Heroes](tutorial), un ejercicio práctico completo que le presenta el proceso de desarrollo de la aplicación mediante la CLI de Angular y recorre subsistemas importantes.

* Para obtener más información sobre el uso de Angular CLI, consulte la [Descripción general de CLI](cli "Descripción general de CLI"). Además de crear el espacio de trabajo inicial y el andamiaje de la aplicación, puede usar la CLI para generar código angular, como componentes y servicios. La CLI admite el ciclo de desarrollo completo, incluida la creación, las pruebas, la agrupación y la implementación.

* Para obtener más información sobre los archivos angulares generados por `ng new`, consulte [Espacio de trabajo y estructura de archivos del proyecto](guide/file-structure).