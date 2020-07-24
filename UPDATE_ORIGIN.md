Cómo actualizar el contenido original de # angular.io

## Preparación anticipada

-prepare node_modules
-Preparación de submódulos de Git

## Flujo de trabajo

1. Edite `update-origin.sh`

Obtenga el `aioHash` del último pie de página angular.io.

! [imagen] (./ docs / aio-origin-hash.png)

`` `sh
aioHash = "4bc0084"
`` `

2. Ejecute `update-origin.sh`

3. Migra tus cambios


## Migración

### Patrón 1. Original a original

-`foobar.md` (no traducido)
-`contributors.json`
-`resouces.json`
-`presskit.html`

Si el archivo traducido no existe, se aplicará tal cual.

### Patrón 2. Archivo original traducido

-`foobar.en.md`
-`index.en.html`

#### Si el cambio es pequeño

Si es necesario volver a traducir los cambios, se reflejarán en el archivo traducido.

#### Cuando los cambios son grandes

1. Copie el texto original en la parte correspondiente del archivo traducido en el estado no traducido para que esté en un estado mixto de español e inglés.
2. Cree un Issue para solicitar la traducción de partes no traducidas.

### Patrón 3. código de aplicación aio

Algunos archivos se han modificado para modificar la aplicación angular.io, pero una actualización de git borra esos cambios.

-`navigation.model.ts`
-`nav-item.component.html`
-`doc-viewer.component.ts`
-`githubLinks.html`

Para estos archivos, deje los cambios que desee y combine los otros cambios manualmente.