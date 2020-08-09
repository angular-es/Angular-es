# Introducción a los módulos

Las aplicaciones de Angular son modulares y Angular tiene su propio sistema de modularidad llamado *NgModules*.
Los NgModules son contenedores para un bloque cohesivo de código dedicado a un dominio de aplicación, un flujo de trabajo o un conjunto de capacidades estrechamente relacionado. Pueden contener componentes, proveedores de servicios y otros archivos de código cuyo alcance está definido por el NgModule que los contiene. Pueden importar la funcionalidad que se exporta desde otros NgModules y exportar la funcionalidad seleccionada para que la utilicen otros NgModules.

Cada aplicación Angular tiene al menos una clase NgModule, [el *módulo raíz*](guide/bootstrapping), que se llama convencionalmente `AppModule` y reside en un archivo llamado `app.module.ts`. Lanzas tu aplicación *bootstrapping* el NgModule raíz.

Si bien una aplicación pequeña puede tener solo un NgModule, la mayoría de las aplicaciones tienen muchos más *módulos de funciones*. El *root* NgModule para una aplicación se llama así porque puede incluir NgModules secundarios en una jerarquía de cualquier profundidad.

## Metadatos de NgModule

Un NgModule se define mediante una clase decorada con `@NgModule()`. El decorador `@NgModule()` es una función que toma un único objeto de metadatos, cuyas propiedades describen el módulo. Las propiedades más importantes son las siguientes.

* `declaraciones`: Los [componentes](guide/architecture-components), *directivas* y *tuberías* que pertenecen a este NgModule.

* `exports`: el subconjunto de declaraciones que deberían ser  visibles y utilizables en las *plantillas de componentes* de otros NgModules.

* `imports`: Otros módulos cuyas clases exportadas son necesarias para las plantillas de componentes declaradas en *este* NgModule.

* `proveedores`: Creadores de [servicios](guide/architecture-services) que este NgModule contribuye a la colección global de servicios; se vuelven accesibles en todas las partes de la aplicación. (También puede especificar proveedores a nivel de componente, que a menudo se prefiere).

* `bootstrap`: La vista principal de la aplicación, llamada *componente raíz*, que aloja todas las demás vistas de la aplicación. Solo el *root NgModule* debería establecer la propiedad `bootstrap`.

Aquí hay una definición raíz simple de NgModule.

<code-example path="architecture/src/app/mini-app.ts" region="module" header="src/app/app.module.ts"></code-example>

<div class="alert is-helpful">

`AppComponent` se incluye en la lista de `exportaciones` aquí como ilustración; en realidad no es necesario en este ejemplo. Un NgModule raíz no tiene ninguna razón para *exportar* nada porque otros módulos no necesitan *importar* el NgModule raíz.

</div>

## NgModules y componentes

NgModules proporciona un *contexto de compilación* para sus componentes. Un NgModule raíz siempre tiene un componente raíz que se crea durante el arranque, pero cualquier NgModule puede incluir cualquier número de componentes adicionales, que se pueden cargar a través del enrutador o crear a través de la plantilla. Los componentes que pertenecen a un NgModule comparten un contexto de compilación.

<div class="lightbox">
  <img src="generated/images/guide/architecture/compilation-context.png" alt="Component compilation context" class="left">
</div>

<br class="clear">

Un componente y su plantilla juntos definen una *vista*. Un componente puede contener una *jerarquía de vista*, que le permite definir áreas arbitrariamente complejas de la pantalla que se pueden crear, modificar y destruir como una unidad. Una jerarquía de vistas puede mezclar vistas definidas en componentes que pertenecen a diferentes NgModules. Este suele ser el caso, especialmente para las bibliotecas de interfaz de usuario.

<div class="lightbox">
  <img src="generated/images/guide/architecture/view-hierarchy.png" alt="View hierarchy" class="left">
</div>

<br class="clear">

Cuando crea un componente, se asocia directamente con una sola vista, llamada *vista de host*. La vista de host puede ser la raíz de una jerarquía de vistas, que puede contener *vistas incrustadas*, que a su vez son las vistas de host de otros componentes. Esos componentes pueden estar en el mismo NgModule o pueden importarse desde otros NgModules. Las vistas en el árbol se pueden anidar a cualquier profundidad.

<div class="alert is-helpful">

**Nota:** La estructura jerárquica de las vistas es un factor clave en la forma en que Angular detecta y responde a los cambios en el DOM y los datos de la aplicación.

</div>

## NgModules y módulos JavaScript

El sistema NgModule es diferente y no está relacionado con el sistema de módulos JavaScript (ES2015) para administrar colecciones de objetos JavaScript. Estos son sistemas de módulos *complementarios* que puede usar juntos para escribir sus aplicaciones.

En JavaScript, cada *archivo* es un módulo y todos los objetos definidos en el archivo pertenecen a ese módulo.
El módulo declara que algunos objetos son públicos marcándolos con la palabra clave `export`.
Otros módulos de JavaScript usan *declaraciones de importación* para acceder a objetos públicos de otros módulos.

<code-example path="architecture/src/app/app.module.ts" region="imports"></code-example>

<code-example path="architecture/src/app/app.module.ts" region="export"></code-example>

<div class="alert is-helpful">
  <a href="http://exploringjs.com/es6/ch_modules.html">Obtenga más información sobre el sistema de módulos de JavaScript en la web.</a>
</div>

## Bibliotecas angular

<img src="generated/images/guide/architecture/library-module.png" alt="Component" class="left">

Angular se carga como una colección de módulos JavaScript. Puede pensar en ellos como módulos de biblioteca. Cada nombre de biblioteca angular comienza con el prefijo `@angular`. Instálelos con el administrador de paquetes de nodos `npm` e importe partes de ellos con declaraciones de importación de JavaScript.

<br class="clear">

Por ejemplo, importe el decorador `Component` de Angular de la biblioteca `@angular/core` de esta manera.

<code-example path="architecture/src/app/app.component.ts" region="import"></code-example>

También importa NgModules desde las *bibliotecas* Angular usando declaraciones de importación de JavaScript.
Por ejemplo, el siguiente código importa el NgModule `BrowserModule` de la biblioteca `platform-browser`.

<code-example path="architecture/src/app/mini-app.ts" region="import-browser-module"></code-example>

En el ejemplo del módulo raíz simple anterior, el módulo de la aplicación necesita material desde dentro
`BrowserModule`. Para acceder a ese material, agréguelo a los metadatos de `@NgModule` como este.

<code-example path="architecture/src/app/mini-app.ts" region="ngmodule-imports"></code-example>

De esta manera, está utilizando los sistemas de módulos Angular y JavaScript _juntos_. Aunque es fácil confundir los dos sistemas, que comparten el vocabulario común de "importaciones" y "exportaciones", se familiarizará con los diferentes contextos en los que se utilizan.

<div class="alert is-helpful">

Obtenga más información en la guía [NgModules](guide/ngmodules).

</div>
