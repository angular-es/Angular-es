# Pruébelo: implementación

Para implementar su aplicación, debe compilarla y luego alojar JavaScript, CSS y HTML en un servidor web. Las aplicaciones Built Angular son muy portátiles y pueden vivir en cualquier entorno o servidas por cualquier tecnología, como Node, Java, .NET, PHP y muchas otras.

<div class="alert is-helpful">

Ya sea que haya venido aquí directamente desde la [Parte 1](start "Pruébelo: una aplicación básica"), o completó toda la aplicación de la tienda en línea a través de la [Navegación en la aplicación](start/start-routing  "Pruébelo: en la aplicación navegación "), [Administrar datos](start/start-data "Pruébelo: administrar datos ") y [Formularios para entrada de usuario](start/start-forms "Pruébelo: Formularios para entrada de usuario "), tiene una aplicación que puede implementar siguiendo las instrucciones de esta sección.

</div>

## Comparte tu aplicación

Los proyectos de StackBlitz son públicos de forma predeterminada, lo que le permite compartir su aplicación Angular a través de la URL del proyecto. Tenga en cuenta que esta es una excelente manera de compartir ideas y prototipos, pero no está destinada al alojamiento de producción.

1. En su proyecto StackBlitz, asegúrese de haber bifurcado o guardado su proyecto.
1. En la página de vista previa, debería ver una URL similar a `https: // <ID del proyecto> .stackblitz.io`.
1. Comparta esta URL con un amigo o colega.
1. Los usuarios que visiten su URL verán que se inicia un servidor de desarrollo y luego se cargará su aplicación.

## Construyendo localmente

Para construir su aplicación localmente o para producción, descargue el código fuente de su proyecto StackBlitz haciendo clic en el ícono `Descargar proyecto` en el menú de la izquierda frente a `Proyecto` para descargar sus archivos.

Una vez que haya descargado y descomprimido el código fuente, use la [Consola Angular](https://angularconsole.com "sitio web de la Consola Angular") para servir la aplicación, o instale `Node.js` y sirva su aplicación con Angular CLI.

Desde la terminal, instale Angular CLI globalmente con:

```sh
npm install -g @angular/cli
```

Esto instala el comando `ng` en su sistema, que es el comando que usa para crear nuevos espacios de trabajo, nuevos proyectos, servir su aplicación durante el desarrollo o producir compilaciones para compartir o distribuir.

Cree un nuevo espacio de trabajo CLI angular usando el comando [`ng new`](cli/new "CLI de la nueva referencia de comando"):

```sh
ng new my-project-name
```

En su nueva aplicación generada por CLI, reemplace la carpeta `/src` con la de su descarga de `StackBlitz` y luego realice una compilación.

```sh
ng build --prod
```

Esto producirá los archivos que necesita implementar.

<div class="alert is-helpful">

Si el comando `ng build` anterior arroja un error sobre los paquetes faltantes, agregue las dependencias faltantes en el archivo `package.json` de su proyecto local para que coincida con el del proyecto StackBlitz descargado.

</div>

#### Hospedaje del proyecto construido

Los archivos de la carpeta `dist / my-project-name` son estáticos. Esto significa que puede alojarlos en cualquier servidor web capaz de entregar archivos (como `Node.js`, Java, .NET) o cualquier backend (como Firebase, Google Cloud o App Engine).

### Alojar una aplicación Angular en Firebase

Una de las formas más fáciles de hacer que su sitio esté activo es alojarlo con Firebase.

1. Regístrese para obtener una cuenta de firebase en [Firebase](https://firebase.google.com/ "sitio web de Firebase").
1. Cree un nuevo proyecto, dándole el nombre que desee.
1. Agregue los esquemas `@angular/fire` que manejarán su implementación usando `ng add @ angular/fire`.
1. Conecte su CLI a su cuenta de Firebase e inicialice la conexión a su proyecto usando `firebase login` y `firebase init`.
1. Siga las indicaciones para seleccionar el proyecto "Firebase" que está creando para el alojamiento.
    - Seleccione la opción "Alojamiento" en el primer mensaje.
    - Seleccione el proyecto que creó anteriormente en Firebase.
    - Seleccione `dist/my-project-name` como directorio público.
1. Implemente su aplicación con `ng deploy`.
1. Una vez implementado, visite https://your-firebase-project-name.firebaseapp.com para verlo en vivo.

### Alojar una aplicación Angular en cualquier otro lugar

Para alojar una aplicación Angular en otro servidor web, cargue o envíe los archivos al servidor.
Debido a que está construyendo una aplicación de una sola página, también deberá asegurarse de redirigir cualquier URL no válida a su archivo `index.html`.
Lea más sobre el desarrollo y la distribución de su aplicación en las guías de [Creación y servicio](guide/build "Creación y servicio de aplicaciones angulares") y [Implementación](guide/deployment "Guía de implementación").

## Únete a la comunidad Angular

¡Ahora eres un desarrollador de Angular! [Comparte este momento](https://twitter.com/intent/tweet?url=https://angular.io/start&text=I%20just%20finished%20the%20Angular%20Getting%20Started%20Tutorial "Angular en Twitter" ), díganos qué le pareció este ejercicio de introducción o envíe [sugerencias para ediciones futuras](https://github.com/angular/angular/issues/new/choose "Formulario de nueva edición del repositorio de Angular GitHub").

Angular ofrece muchas más capacidades, y ahora tiene una base que le permite crear una aplicación y explorar esas otras capacidades:

* Angular proporciona capacidades avanzadas para aplicaciones móviles, animación, internacionalización, renderización del lado del servidor y más.
* [Angular Material](https://material.angular.io/ "Sitio web de Angular Material") ofrece una extensa biblioteca de componentes de Material Design.
* [Angular Protractor](https://protractor.angular.io/ "Sitio web de Angular Transport") ofrece un marco de prueba de extremo a extremo para aplicaciones angulares.
* Angular también tiene una extensa [red de herramientas y bibliotecas de terceros](resources "Lista de recursos de Angular").

Manténgase actualizado siguiendo el [Blog de Angular](https://blog.angular.io/ "Blog de Angular").
