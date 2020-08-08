# Contribución a angular-es

## Organización de archivos

-`origin`: gestiona el repositorio `angular/angular` como un submódulo
-`aio-es`: gestiona el archivo fuente de traducción `xxx.en.md`, el archivo de traducción `.md` y otros archivos para sobrescribir `origin`.

### Estructura del directorio aio

Básicamente, el archivo Markdown en el directorio `content` está traducido.
Si es necesario, edite también el código fuente de la aplicación.

https://github.com/angular/angular/tree/master/aio

```
origen/aio/
├── README.md
├── contenido # Un archivo de recursos de documentos escrito en Markdown o HTML. Principalmente traduzca archivos aquí
│ ├── recurso de documento cli #CLI
│ ├── ejemplos # Código fuente del código de muestra
│ ├── guía # Recurso de documento de guía
│ ├── imágenes # Imagen en la documentación
│ ├── marketing # Recursos para presentar Angular, como enlaces e información de eventos
│ ├── inicio # Introducción Recursos del tutorial
│ ├── navigation.json # Archivos de administración de navegación del sitio
│ └── tutorial # Tour de los Heroes Recursos del tutorial
├── código fuente de la aplicación src # angular.io
...

```

## Flujo del proceso de traducción

Antes de comenzar a traducir, asegúrese de que nadie esté intentando traducir el mismo archivo.
[Verificación de traducción](https://github.com/angular/angular-es/labels/type%3A%20Translation%20Checkout) Si observa el tema de la etiqueta, puede ver el área donde actualmente estamos trabajando en la traducción.
Si desea hacer una nueva traducción, [Crear problema](https://github.com/angular/angular-es/issues/new/choose) y complete la información de acuerdo con Plantillas.

## Corrección menor

Para correcciones menores a la documentación ya traducida, cree una solicitud de extracción con la función `Editar` en GitHub.

![edit-on-github](./docs/edit-on-github.png)

## Añadir traducción

Para traducir un documento no traducido nuevamente, copie el archivo fuente como `xxx.en.md` de `origin` a `aio-es` y cree una traducción para esa fuente como `xxx.md`. ..
Envíe una solicitud de extracción para agregar los dos archivos.

### Preparación local

#### 1. Clonación de el repositorio

``` 
$ git clone git@github.com: angular/angular-es.git

```

#### 2. Sincronización del repositorio de origen

Este repositorio utiliza un submódulo para integrarse con el repositorio de origen.

```
$ git sincronización de submódulo
Actualización del submódulo $ git --init

```

#### 3. Primera compilación

Cuando se complete la compilación, el sitio de documentación se mostrará en el directorio `.tmp/aio/dist`.
Puede verificar el sitio creado configurando un servidor de desarrollo con su herramienta favorita.

```
$ ./build.sh

```

**Nota**

-El tiempo de construcción es muy largo, así que espere mientras prepara café.
-En MacOS, el descriptor de archivo del sistema operativo se puede utilizar durante el proceso de compilación.
  En ese caso, debe aumentar el número máximo de la siguiente manera.

https://github.com/meteor/meteor/issues/8057#issuecomment-261011063

```
$ echo kern.maxfiles = 65536 | sudo tee -a /etc/sysctl.conf
$ echo kern.maxfilesperproc = 65536 | sudo tee -a /etc/sysctl.conf
$ sudo sysctl -w kern.maxfiles = 65536
$ sudo sysctl -w kern.maxfilesperproc = 65536
$ ulimit -n 65536

```

#### Trabajando con compilaciones diferenciales

Después de hacer una compilación local una vez, puede reescribir el archivo directamente en el directorio `.tmp/aio` y trabajar sin problemas con una compilación diferencial.
Mientras se ejecute el comando `yarn serve-and-sync`, puede reconstruir automáticamente cuando haya cambios en los archivos en `.tmp/aio`.
Sin embargo, el trabajo en el directorio `.tmp` no es administrado por Git, así que asegúrese de reflejarlo en el directorio `aio-es` después del trabajo.

```
$ cd .tmp/aio
$ yarn serve-and-sync
# localhost:4200 iniciará el servidor

```

### Creando una solicitud de traducción

Antes de comenzar a traducir, asegúrese de que nadie esté intentando traducir el mismo archivo.
[Verificación de traducción](https://github.com/angular/angular-es/labels/type%3A%20Translation%20Checkout) Si observa el tema de la etiqueta, puede ver el área donde actualmente estamos trabajando en la traducción.
Si desea hacer una nueva traducción, [Crear problema](https://github.com/angular/angular-es/issues/new/choose) y complete la información de acuerdo con Plantillas.

### Crear una solicitud de extracción de traducción

Envíe los cambios al repositorio donde bifurcó angular/angular-es y envíe una solicitud de extracción a la fuente de la bifurcación.
Las solicitudes de extracción se revisarán y fusionarán si todo está bien

## Pautas de traducción

Siga las pautas a continuación para la traducción al español.

### Guardar el texto fuente como un archivo `.en.md`

Para gestionar la diferencia del texto original después de actualizar el origen, guarde el texto original en el momento de la traducción como un archivo `xxx.en.md`.
Para una nueva traducción, copie el archivo inglés `xxx.md` en el archivo `xxx.en.md` y edite el archivo fuente de la copia `xxx.md`.

### Alinear la posición de salto de línea con el texto original

Si es posible, asegúrese de que las líneas originales y traducidas tengan el mismo número de líneas, y coopere para facilitar la verificación de diferencias al actualizar.

### Seguir textlint

La unificación básica de las fluctuaciones de notación se puede corregir automáticamente mediante textlint.
Si textlint detecta un error, se detecta en CI y la solicitud de extracción no se puede fusionar.

### Mantenga matices originales

Dado que la documentación es un documento técnico, manteniendo la legibilidad , mantenga los matices del texto original tanto como sea posible y mantenga las traducciones al mínimo.

Hasta que se acostumbre, se recomienda proceder corrigiendo los términos específicos de Angular basados ​​en traducciones automáticas como Google Translate.

### Acerca de 'Enlaces colgantes encontrados': Agregar ancla

Cuando compila, puede obtener el siguiente error:

```
warn: Dangling Links Found in "guide/despliegue.json":
 -guide / browser-support # polyfills
warn: Dangling Links Found in "guide / deprecations.json":
 -guide/releases # deprecation-practices,
 -guide/component-styles # deprecated-deep - y-ng-deep
warn: Dangling Links Found in "guide / glossary.json":
 -guide/workspace-config # project-tool-configuration-options,
 -guide/workspace-config # project-tool-configuration-options
warn: Dangling Links Found in "api/common/NgForOf.json":
 -guide/template-syntax # template-reference-variables - var-
error: Error: 6 enlaces no coincidentes

```

Este error es un enlace relativo en la documentación que advierte que no se puede encontrar el enlace.
En el primer ejemplo anterior, aunque la `guía/implementación` está vinculada a `guide/browser-support # polyfills`, la página `guide/browser-support` dice `#polyfills`. Advertencia de que el titular no existe.

Este error a menudo ocurre cuando traduce un encabezado que comienza con `#`. Debe agregar un ancla en la traducción para resolver la referencia del enlace. Agregue una directiva del formulario `{@a xxxxxx}` al encabezado traducido de la siguiente manera.

```md

## Polyfill {@a polyfills}

```
