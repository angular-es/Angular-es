# Entorno local y preparación del espacio de trabajo


Esta guía describe cómo utilizar la [Herramienta CLI de Angular](cli "CLI referencia de comando")para configurar su entorno para el desarrollo angular.
Incluye información sobre los requisitos previos, la instalación de la CLI, el espacio de trabajo inicial y la creación de la aplicación de inicio, y la ejecución local de esa aplicación para ver la preparación.


<div class="callout is-helpful">
<header> Pruebe Angular sin preparación local </header>

Si es nuevo en Angular, puede ser una buena idea comenzar con [Primeros pasos](inicio). Comenzar le ayudará a aprender los conceptos básicos de Angular de inmediato mediante la creación de una aplicación de tienda en línea modificable y lista para usar. [StackBlitz](https://stackblitz.com/) Estamos aprovechando un entorno de desarrollo en línea, para que no tenga que preparar su entorno local hasta que esté listo.

</div>


{@a devenv}
{@a prerequisites}
## Pre-Requisitos

Para usar el marco de refencia (framework) Angular, debe estar familiarizado con lo siguiente:

* [JavaScript](https://developer.mozilla.org/ja/docs/Web/JavaScript/A_re-introduction_to_JavaScript)
* [HTML](https://developer.mozilla.org/ja/docs/Learn/HTML/Introduction_to_HTML)
* [CSS](https://developer.mozilla.org/ja/docs/Learn/CSS/First_steps)

El conocimiento de [TypeScript](https://www.typescriptlang.org/) es útil, pero no requerido.

Para instalar Angular en su sistema local, necesita lo siguiente:

{@a nodejs}

* **Node.js**

  Angular requiere una [LTS actual , activa o LTS de mantenimiento](https://nodejs.org/about/releases/) versión de `Node.js`.

  <div class="alert is-helpful">

 Para obtener información sobre los requisitos específicos de la versión, consulte la llave `engine` en el archivo [package.json](https://unpkg.com/@angular/cli/package.json).

  </div>

  Para obtener más información sobre la instalación   de Node.js, consulte [nodejs.org](http://nodejs.org "Nodejs.org").
  Si no está seguro de qué versión de Node.js se ejecuta en su sistema, ejecute `node -v` en una ventana de terminal.

{@a npm}

* **npm package manager**

  Las aplicaciones Angular, Angular CLI y Angular dependen de [paquetes npm](https://docs.npmjs.com/getting-started/what-is-npm) para muchas características y funciones.
   Para descargar e instalar paquetes npm, necesita un administrador de paquetes npm.
   Esta guía utiliza la interfaz de línea de comando [npm client](https://docs.npmjs.com/cli/install), que se instala con `Node.js` de forma predeterminada.
   Para verificar que tiene instalado el cliente npm, ejecute `npm -v` en una ventana de terminal.


{@a install-cli}

## Instalar CLI de Angular

Utiliza la CLI angular para crear proyectos, generar código de aplicación y biblioteca, y realizar una variedad de tareas de desarrollo en curso, como pruebas, agrupación e implementación.

Para instalar la CLI angular, abra una ventana de terminal y ejecute el siguiente comando:

<code-example language="sh" class="code-shell">
  npm install -g @angular/cli
</code-example>

{@a create-proj}

## Crear espacio de trabajo y aplicación inicial

Desarrolle la aplicación en el contexto de Angular [**espacio de trabajo**](guide/glossary#workspace)

Para crear un nuevo espacio de trabajo y una aplicación inicial inicial:

1. Ejecute el comando CLI `ng new` y asígnele el nombre` my-app`, como se muestra a continuación.

    <code-example language="sh" class="code-shell">
      ng new my-app

    </code-example>

2. Usando el comando `ng new`, se le pedirá que ingrese información sobre las funciones que se incluirán en la primera aplicación. Presione Entrar o Volver para aceptar el valor predeterminado.

Angular CLI instala los paquetes angulares npm necesarios y otras dependencias. Esto puede tomar unos pocos minutos.

La CLI crea un nuevo espacio de trabajo y una aplicación de bienvenida simple, lista para ejecutarse.

<div class="alert is-helpful">

También tiene la opción de usar el modo estricto angular, que puede ayudarlo a escribir un código mejor y más fácil de mantener.
Para más información, ver [Modo estricto](/guide/strict-mode).

</div>

{@a serve}

## Ejecuta la aplicación

La CLI Angular incluye un servidor para que pueda compilar y servir su aplicación localmente.

1. Vaya a la carpeta del espacio de trabajo (`my-app`).

1. Ejecute el siguiente comando.

<code-example language="sh" class="code-shell">
  cd my-app
  ng serve --open
</code-example>

El comando `ng serve` inicia el servidor, mira los  archivos,
Reconstruya su aplicación cuando cambie esos archivos.

La opción `--open` (o simplemente` -o`) hace que el navegador se active automáticamente
Ábralo en `http: // localhost: 4200 /`.
 
Si su instalación y configuración se realizó correctamente, debería ver una página similar a la siguiente.


<div class="lightbox">
  <img src='generated/images/guide/setup-local/app-works.png' alt="Welcome to my-app!">
</div>


## Próximos pasos


* Para obtener una introducción más completa a los conceptos básicos y la terminología de la arquitectura de aplicaciones de una página angular y los principios de diseño, lea la sección[Conceptos de Angular](guide/architecture).

* Te presenta el proceso de desarrollo de aplicaciones usando la CLI Angular y ejecuta el[Tutorial de Tour of Heroes](tutorial), un ejercicio práctico completo que te guía a través de los subsistemas importantes.

* Para obtener más información sobre el uso de la CLI angular, consulte la Descripción general de la CLI [Angular-Cli](cli 'CLI Overview'). Además de crear un espacio de trabajo inicial y una plantilla para su aplicación, puede usar la CLI para generar código angular para componentes, servicios, etc. La CLI admite todo el ciclo de desarrollo, incluida la compilación, prueba, agrupación y Desplegar.

-Para obtener más información sobre los archivos angulares generados por `ng new`, consulte [Espacio de trabajo y estructura de archivos del proyecto](guide/file-structure).
