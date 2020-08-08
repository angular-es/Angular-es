# Parte 1: Empezando con una aplicación Angular básica

¡Bienvenido a Angular!

Este tutorial le presenta los conceptos básicos de Angular y lo guía a través de un sitio de comercio electrónico simple con un catálogo, un carrito de compras y un formulario de pago.
Para ayudarlo a comenzar de inmediato, esta guía utiliza una aplicación sencilla lista para usar que puede examinar y modificar de forma interactiva (sin tener que [configurar un entorno de trabajo local](guide/setup-local "Guía de configuración")).

<div class="callout is-helpful">
<header>¿Es nuevo en el desarrollo web?</header>

Hay muchos recursos para complementar los documentos de Angular. Los documentos MDN de Mozilla incluyen tanto [HTML](https://developer.mozilla.org/en-US/docs/Learn/HTML "Aprendizaje de HTML: guías y tutoriales") y [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript "JavaScript") introducciones. [Los documentos de TypeScript](https://www.typescriptlang.org/docs/home.html "Documentación de TypeScript") incluyen un tutorial de 5 minutos. Varias plataformas de cursos en línea, como [Udemy](http://www.udemy.com "Cursos en línea de Udemy") y [Codecademy](https://www.codecademy.com/ "Cursos en línea de Codecademy"), también cubren conceptos básicos de desarrollo web.

</div>

{@a new-project}

## Cree el proyecto de muestra

<h4>
<live-example name="getting-started-v0" noDownload>Haga clic aquí para crear el proyecto de muestra listo para usar en StackBlitz.</live-example>
</h4>

<div class="lightbox">
  <img src="generated/images/guide/start/new-app-all.gif" alt="Starter online store app">
</div>

- El panel de vista previa a la derecha muestra el estado inicial de la aplicación Angular de muestra.
  Define un marco con una barra superior (que contiene el nombre de la tienda y el icono de pago) y el título de una lista de productos (que se completará y actualizará dinámicamente con datos de la aplicación).

- El panel del proyecto de la izquierda muestra los archivos de origen que componen la aplicación, incluidos todos los archivos de configuración e infraestructura. El archivo seleccionado actualmente aparece en el panel del editor en el medio.

Antes de entrar en la estructura de la fuente, la siguiente sección muestra cómo completar la _plantilla_ HTML para la lista de productos, utilizando los datos de muestra proporcionados.
Esto debería darle una idea de lo fácil que es modificar y actualizar la página de forma dinámica.

<div class="callout is-helpful">
<header>Consejos de StackBlitz</header>

- Inicie sesión en StackBlitz para que pueda guardar y reanudar su trabajo.
  Si tiene una cuenta de GitHub, puede iniciar sesión en StackBlitz
  con esa cuenta. Para guardar su progreso, primero
  bifurque el proyecto usando el botón Bifurcación en la parte superior izquierda,
  entonces podrás guardar tu trabajo en tu propio StackBlitz
  cuenta haciendo clic en el botón Guardar.
- Para copiar un ejemplo de código de este tutorial, haga clic en el icono
  en la parte superior derecha del cuadro de ejemplo de código y luego pegue el
  fragmento de código del portapapeles en StackBlitz.
- Si el panel de vista previa de StackBlitz no muestra lo que
  esperar, guardar y luego hacer clic en el botón actualizar.
- StackBlitz mejora continuamente, por lo que puede haber
  ligeras diferencias en el código generado, pero la aplicación
  el comportamiento será el mismo.
- Cuando genera las aplicaciones de ejemplo de StackBlitz que
  acompañar los tutoriales, StackBlitz crea el iniciador
  archivos y datos simulados para usted. Los archivos que usará en todo
  los tutoriales están en la carpeta `src` de StackBlitz
  aplicaciones de ejemplo.

</div>

<div class="alert is-important">

Si va directamente al [entorno de desarrollo en línea de StackBlitz](https://stackblitz.com/) y elige [iniciar un nuevo espacio de trabajo angular](https://stackblitz.com/fork/angular), obtiene un aplicación de código auxiliar, en lugar de esta [muestra ilustrativa](#new-project). Una vez que haya sido introducido a los conceptos básicos aquí, esto puede ser útil para trabajar de forma interactiva mientras aprende Angular.

En el desarrollo real, normalmente usará [Angular CLI](guide/glossary#command-line-interface-cli "Definición de CLI"), una poderosa herramienta de línea de comandos que le permite generar y modificar aplicaciones. Para obtener una guía completa paso a paso que muestra cómo usar la CLI para crear un nuevo proyecto y todas sus partes, consulte [Tutorial: Tour of Heroes](tutorial).

</div>

{@a template-syntax}

## Sintaxis de la plantilla

La sintaxis de la plantilla de Angular extiende HTML y JavaScript.
Esta sección presenta la sintaxis de la plantilla mejorando el área "Productos".

<div class="alert is-helpful">

Para ayudarlo a comenzar, los siguientes pasos usan datos de productos predefinidos del archivo `products.ts` (ya creado en el ejemplo de StackBlitz) y métodos del archivo `product-list.component.ts`.

</div>

1. En la carpeta `product-list`, abra el archivo de plantilla `product-list.component.html`.

1. Modifique la plantilla de la lista de productos para mostrar una lista de nombres de productos.

   1. Todos los productos de la lista se muestran de la misma manera, uno tras otro en la página. Para iterar sobre la lista predefinida de productos, coloque la directiva `*ngFor` en un `<div>`, de la siguiente manera:

     <code-example header="src/app/product-list/product-list.component.html" path="getting-started/src/app/product-list/product-list.component.2.html" region="ngfor">
     </code-example>

   Con `* ngFor`, el`<div>`se repite para cada producto de la lista.

     <div class="alert is-helpful">

   `* ngFor` es una" directiva estructural ". Las directivas estructurales dan forma o remodelan la estructura del DOM, generalmente agregando, quitando y manipulando los elementos a los que están adjuntos. Las directivas con un asterisco, `*`, son directivas estructurales.

     </div>

   1. Para mostrar los nombres de los productos, utilice la sintaxis de interpolación `{{}}`. La interpolación representa el valor de una propiedad como texto. Dentro de `<div>`, agregue un `<h3>` para mostrar la interpolación de la propiedad del nombre del producto:

     <code-example path="getting-started/src/app/product-list/product-list.component.2.html" header="src/app/product-list/product-list.component.html" region="interpolation">
     </code-example>

   El panel de vista previa se actualiza inmediatamente para mostrar el nombre de cada producto en la lista.

     <div class="lightbox">
       <img src="generated/images/guide/start/template-syntax-product-names.png" alt="Product names added to list">
     </div>

1. Para hacer que el nombre de cada producto sea un enlace a los detalles del producto, agregue el elemento `<a>` y establezca su título como el nombre del producto utilizando la sintaxis de enlace de propiedad `[]`, de la siguiente manera:

   <code-example path="getting-started/src/app/product-list/product-list.component.2.html" header="src/app/product-list/product-list.component.html">
   </code-example>

En el panel de vista previa, mantenga el puntero sobre un producto
name para ver el valor de la propiedad del nombre enlazado, que es
el nombre del producto más la palabra "detalles".
La interpolación `{{}}` le permite renderizar el
valor de propiedad como texto; el enlace de propiedad `[]` te permite
utilice el valor de la propiedad en una expresión de plantilla.

   <div class="lightbox">
     <img src="generated/images/guide/start/template-syntax-product-anchor.png" alt="Product name anchor text is product name property">
   </div>

4. Agregue las descripciones de los productos. En el elemento `<p>`, use una directiva `*ngIf` para que Angular solo cree el elemento `<p>` si el producto actual tiene una descripción.

   <code-example path="getting-started/src/app/product-list/product-list.component.3.html" header="src/app/product-list/product-list.component.html">
   </code-example>

La aplicación ahora muestra el nombre y la descripción de cada producto en la lista. Tenga en cuenta que el producto final no tiene un párrafo de descripción. Debido a que la propiedad de descripción del producto está vacía, Angular no crea el elemento&mdash; `<p>` que incluye la palabra "Descripción".

   <div class="lightbox">
     <img src="generated/images/guide/start/template-syntax-product-description.png" alt="Product descriptions added to list">
   </div>

5. Agregue un botón para que los usuarios puedan compartir un producto con amigos. Vincula el evento `click` del botón al método `share()`(en`product-list.component.ts`). El enlace de eventos usa un conjunto de paréntesis, `()`, alrededor del evento, como en el siguiente elemento `<button>`:

   <code-example path="getting-started/src/app/product-list/product-list.component.4.html" header="src/app/product-list/product-list.component.html">
   </code-example>

   Cada producto tiene ahora un botón "Compartir":

   <div class="lightbox">
     <img src="generated/images/guide/start/template-syntax-product-share-button.png" alt="Share button added for each product">
   </div>

Prueba el botón "Compartir":

   <div class="lightbox">
     <img src="generated/images/guide/start/template-syntax-product-share-alert.png" alt="Alert box indicating product has been shared">
   </div>

La aplicación ahora tiene una lista de productos y una función para compartir.
En el proceso, ha aprendido a usar cinco características comunes de la sintaxis de la plantilla de Angular:

- `*ngFor`
- `*ngIf`
- Interpolación `{{}}`
- Propiedad vinculante `[]`
- Enlace de eventos `()`

<div class="alert is-helpful">

Para una introducción más completa a la sintaxis de la plantilla angular, consulte [Introducción a componentes y plantillas](guide/architecture-components#template-syntax "Sintaxis de plantilla").

</div>

{@a components}

## Componentes

_Componentes_ definen áreas de responsabilidad en la interfaz de usuario, o UI,
que le permiten reutilizar conjuntos de funciones de la interfaz de usuario.
Ya ha creado uno con el componente de lista de productos.

Un componente consta de tres cosas:

- **Una clase de componente** que maneja datos y funcionalidad. En la sección anterior, los datos del producto y el método `share()` en la clase de componente manejan datos y funcionalidad, respectivamente.
- **Una plantilla HTML** que determina la interfaz de usuario. En la sección anterior, la plantilla HTML de la lista de productos muestra el nombre, la descripción y un botón "Compartir" para cada producto.
- **Estilos de componentes específicos** que definen la apariencia.
  Aunque la lista de productos no define ningún estilo, aquí es donde el CSS del componente
  reside

<!--
### Class definition

Let's take a quick look a the product list component's class definition:

1. In the `product-list` directory, open `product-list.component.ts`.

1. Notice the `@Component` decorator. This provides metadata about the component, including its templates, styles, and a selector.

    * The `selector` is used to identify the component. The selector is the name you give the Angular component when it is rendered as an HTML element on the page. By convention, Angular component selectors begin with the prefix such as `app-`, followed by the component name.

    * The template and style filename also are provided here. By convention each of the component's parts is in a separate file, all in the same directory and with the same prefix.

1. The component definition also includes an exported class, which handles functionality for the component. This is where the product list data and `Share()` method are defined.

### Composition
-->

Una aplicación Angular comprende un árbol de componentes, en el que cada componente Angular tiene un propósito y una responsabilidad específicos.

Actualmente, la aplicación de ejemplo tiene tres componentes:

<div class="lightbox">
  <img src="generated/images/guide/start/app-components.png" alt="Online store with three components">
</div>

- `app-root` (cuadro naranja) es el shell de la aplicación. Este es el primer componente que se carga y el padre de todos los demás componentes. Puede pensar en ella como la página base.
- `app-top-bar` (fondo azul) es el nombre de la tienda y el botón de pago.
- `app-product-list` (cuadro violeta) es la lista de productos que modificó en la sección anterior.

La siguiente sección amplía las capacidades de la aplicación al agregar un nuevo &mdash;, una alerta de producto&mdash;, como un elemento secundario del componente de lista de productos.

<div class="alert is-helpful">

Para obtener más información sobre los componentes y cómo interactúan con las plantillas, consulte [Introducción a los componentes](guide/architecture-components "Conceptos> Introducción a componentes y plantillas").

</div>

{@a input}

## Entrada

Actualmente, la lista de productos muestra el nombre y la descripción de cada producto.
El componente de lista de productos también define una propiedad de `productos` que contiene datos importados para cada producto de la matriz `productos` en `productos.ts`.

El siguiente paso es crear una nueva función de alerta que tome un producto como entrada. La alerta verifica el precio del producto y, si el precio es superior a \ \$ 700, muestra un botón "Notificarme" que permite a los usuarios registrarse para recibir notificaciones cuando el producto sale a la venta.

1. Cree un nuevo componente de alertas de productos.

   1. Haga clic derecho en la carpeta `app` y use el `Generador angular` para generar un nuevo componente llamado `product-alerts`.

     <div class="lightbox">
       <img src="generated/images/guide/start/generate-component.png" alt="StackBlitz command to generate component">
     </div>

   El generador crea archivos de inicio para las tres partes del componente:

   - `product-alerts.component.ts`
   - `product-alerts.component.html`
   - `product-alerts.component.css`

1. Abra `product-alerts.component.ts`.

   <code-example header="src/app/product-alerts/product-alerts.component.ts" path="getting-started/src/app/product-alerts/product-alerts.component.1.ts" region="as-generated"></code-example>

   1. Observe el decorador `@Component()`. Esto indica que la siguiente clase es un componente. Proporciona metadatos sobre el componente, incluido su selector, plantillas y estilos.

      - El `selector` identifica el componente. El selector es el nombre que le da al componente angular cuando se representa como un elemento HTML en la página. Por convención, los selectores de componentes angulares comienzan con el prefijo `app-`, seguido del nombre del componente.

      - Los nombres de archivo de plantilla y estilo hacen referencia a los archivos HTML y CSS que genera StackBlitz.

   1. La definición del componente también exporta la clase, `ProductAlertsComponent`, que maneja la funcionalidad del componente.

1. Configure el componente de alertas de nuevos productos para recibir un producto como entrada:

   1. Importe `Input` de `@angular/core`.

      <code-example path="getting-started/src/app/product-alerts/product-alerts.component.1.ts" region="imports" header="src/app/product-alerts/product-alerts.component.ts"></code-example>

   1. En la definición de clase `ProductAlertsComponent`, defina una propiedad denominada `producto` con un decorador `@Input()`. El decorador `@Input()` indica que el valor de la propiedad pasa del padre del componente, el componente de la lista de productos.

      <code-example path="getting-started/src/app/product-alerts/product-alerts.component.1.ts" region="input-decorator" header="src/app/product-alerts/product-alerts.component.ts"></code-example>

1. Defina la vista del componente de alerta de producto nuevo.

   1. Abra la plantilla `product-alerts.component.html` y reemplace el párrafo de marcador de posición con un botón" Notificarme "que aparece si el precio del producto es superior a \$ 700.

   <code-example header="src/app/product-alerts/product-alerts.component.html" path="getting-started/src/app/product-alerts/product-alerts.component.1.html"></code-example>

1. Muestre el componente de alerta de producto nuevo como un elemento secundario de la lista de productos.

   1. Abra `product-list.component.html`.

   1. Para incluir el nuevo componente, use su selector, `app-product-alerts`, como lo haría con un elemento HTML.

   1. Pase el producto actual como entrada al componente mediante el enlace de propiedad.

      <code-example header="src/app/product-list/product-list.component.html" path="getting-started/src/app/product-list/product-list.component.5.html" region="app-product-alerts"></code-example>

El componente de alerta de nuevo producto toma un producto como entrada de la lista de productos. Con esa entrada, muestra u oculta el botón "Notificarme", según el precio del producto. El precio del Phone XL es de más de \$ 700, por lo que el botón "Notificarme" aparece en ese producto.

<div class="lightbox">
  <img src="generated/images/guide/start/product-alert-button.png" alt="Product alert button added to products over $700">
</div>

<div class="alert is-helpful">

Consulte [Interacción de componentes](guide/component-interaction "Componentes y plantillas> Interacción de componentes") para obtener más información sobre cómo pasar datos de un componente principal a secundario, interceptar un valor del elemento principal y actuar sobre él, y detectar y actuar sobre los cambios en valores de propiedad de entrada.

</div>

{@a output}

## Salida

Para que funcione el botón "Notificarme", debe configurar dos cosas:

- el componente de alerta del producto para emitir un evento cuando el usuario hace clic en "Notificarme"
- el componente de la lista de productos para actuar en ese evento

1. Abra `product-alerts.component.ts`.

1. Importe `Output` y `EventEmitter` de `@angular/core`:

   <code-example header="src/app/product-alerts/product-alerts.component.ts" path="getting-started/src/app/product-alerts/product-alerts.component.ts" region="imports"></code-example>

1. En la clase de componente, defina una propiedad llamada "notificar" con un decorador "@Output()" y una instancia de "EventEmitter()". Esto permite que el componente de alerta de producto emita un evento cuando cambia el valor de la propiedad de notificación.

<div class="alert is-helpful">

Cuando la CLI de Angular genera un nuevo componente, incluye un constructor vacío, la interfaz `OnInit` y el método `ngOnInit()`.
Dado que el siguiente ejemplo no los usa, se omiten aquí por brevedad.

</div>

    <code-example path="getting-started/src/app/product-alerts/product-alerts.component.ts" header="src/app/product-alerts/product-alerts.component.ts" region="input-output"></code-example>

1. En la plantilla de alerta de producto, `product-alerts.component.html`, actualice el botón" Notificarme "con una vinculación de eventos para llamar al método `notify.emit()`.

   <code-example header="src/app/product-alerts/product-alerts.component.html" path="getting-started/src/app/product-alerts/product-alerts.component.html"></code-example>

1) A continuación, defina el comportamiento que debe ocurrir cuando el usuario hace clic en el botón. Recuerde que es el componente principal de la lista de productos&mdash;, no el componente de alertas de productos&mdash; que actúa cuando el niño plantea el evento. En `product-list.component.ts`, defina un método `onNotify()`, similar al método `share()`:


    <code-example header="src/app/product-list/product-list.component.ts" path="getting-started/src/app/product-list/product-list.component.ts" region="on-notify"></code-example>

1. Por último, actualice el componente de lista de productos para recibir la salida del componente de alertas de productos.

   En `product-list.component.html`, vincule el componente `app-product-alerts` (que es lo que muestra el botón "Notificarme") al método `onNotify()` del componente de lista de productos.

   <code-example header="src/app/product-list/product-list.component.html" path="getting-started/src/app/product-list/product-list.component.6.html" region="on-notify"></code-example>

1. Prueba el botón "Notificarme":

<div class="lightbox">
  <img src="generated/images/guide/start/product-alert-notification.png" alt="Product alert notification confirmation dialog">
</div>

<div class="alert is-helpful">

Consulte [Interacción de componentes](guide/component-interaction "Componentes y plantillas> Interacción de componentes") para obtener más información sobre cómo escuchar eventos de componentes secundarios, leer propiedades secundarias o invocar métodos secundarios y utilizar un servicio para la comunicación bidireccional entre componentes. .

</div>

{@a next-steps}

## Próximos pasos

¡Felicidades! ¡Has completado tu primera aplicación Angular!

Tiene un catálogo básico de la tienda en línea con una lista de productos, el botón "Compartir" y el botón "Notificarme".
Ha aprendido sobre la base de Angular: componentes y sintaxis de plantilla.
También ha aprendido cómo interactúan la clase de componente y la plantilla, y cómo los componentes se comunican entre sí.

Para continuar explorando Angular, elija cualquiera de las siguientes opciones:

- [Continuar con la sección "Navegación en la aplicación"](start/start-routing "Pruébelo: navegación en la aplicación") para crear una página de detalles del producto a la que se puede acceder haciendo clic en el nombre de un producto y que tiene su propia URL patrón.
- [Pase directamente a la sección "Implementación"](start/start-deployment "Pruébelo: Implementación") para pasar al desarrollo local o implementar su aplicación en Firebase o en su propio servidor.
