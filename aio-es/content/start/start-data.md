# Pruébelo: administre datos

Al final de [Navegación en la aplicación](start/start-routing "Pruébelo: Navegación en la aplicación"), la aplicación de la tienda en línea tiene un catálogo de productos con dos vistas: una lista de productos y detalles del producto.
Los usuarios pueden hacer clic en el nombre de un producto de la lista para ver los detalles en una nueva vista, con una URL o ruta distinta.

Esta página lo guía a través de la creación del carrito de compras en tres fases:

- Actualice la vista de detalles del producto para incluir un botón "Comprar", que agrega el producto actual a una lista de productos que administra un servicio de carrito.
- Agregue un componente de carrito, que muestra los artículos en el carrito.
- Agregue un componente de envío, que recupera los precios de envío de los artículos en el carrito mediante el uso de `HttpClient` de Angular para recuperar los datos de envío de un archivo `.json`.

{@a services}

## Servicios

Los servicios son una parte integral de las aplicaciones Angular. En Angular, un servicio es una instancia de una clase que puede poner a disposición de cualquier parte de su aplicación utilizando el [sistema de inyección de dependencia](guide/glossary#dependency-injection-di "Definición de inyección de dependencia") de Angular.

Los servicios son el lugar donde comparte datos entre partes de su aplicación. Para la tienda en línea, el servicio de carrito es donde almacena los datos y métodos de su carrito.

{@a create-cart-service}

## Crea el servicio de carrito de compras

Hasta este punto, los usuarios pueden ver la información del producto y
simular compartir y recibir notificaciones sobre cambios de productos.
Sin embargo, no pueden comprar productos.

En esta sección, agrega un botón "Comprar" al producto
ver detalles y configurar un servicio de carrito para almacenar información
sobre los productos en el carrito.

<div class="alert is-helpful">

Una parte posterior de este tutorial, [Usar formularios para la entrada del usuario](start/start-forms "Pruébelo: formularios para la entrada del usuario"), lo guía a través del acceso a este servicio de carrito desde la vista donde el usuario realiza el pago.

</div>

{@a generate-cart-service}

### Definir un servicio de carrito

    1. Para generar un servicio de carrito, haga clic con el botón derecho en la carpeta `app`, elija `Generator Angular` y elija `Service`. Nombra el nuevo servicio "carrito".

        <code-example header="src/app/cart.service.ts" path="getting-started/src/app/cart.service.1.ts"></code-example>

    <div class="alert is-helpful>

    El generador StackBlitz podría proporcionar el servicio de carrito en `app.module.ts` por defecto. Eso difiere del ejemplo, que usa una técnica de optimización de paquetes, un decorador `@Injectable()` con la declaración `{provideIn: 'root'}`.
     Para obtener más información sobre los servicios, consulte [Introducción a los servicios y la inyección de dependencias](guide/architecture-services "Conceptos> Introducción a los servicios y DI").

    </div>

    1. En la clase `CartService`, defina una propiedad de` items` para almacenar la matriz de los productos actuales en el carrito.

    <code-example path="getting-started/src/app/cart.service.ts" header="src/app/cart.service.ts" region="props"></code-example>

    1. Defina métodos para agregar artículos al carrito, devolver artículos del carrito y borrar los artículos del carrito:

    <code-example path="getting-started/src/app/cart.service.ts" header="src/app/cart.service.ts" region="methods"></code-example>

    - El método `addToCart()` agrega un producto a una matriz de `items`.

     - El método `getItems()` recopila los artículos que los usuarios agregan al carrito y devuelve cada artículo con su cantidad asociada.

     - El método `clearCart()` devuelve una matriz vacía de elementos.

{@a product-details-use-cart-service}

### Usa el servicio de carrito

    Esta sección lo guía a través del uso del servicio de carrito para agregar un producto al carrito con un botón "Comprar".

    . Abra `product-details.component.ts`.

    1. Configure el componente para utilizar el servicio de carrito.

    1. Importe el servicio de carrito.

   <code-example header="src/app/product-details/product-details.component.ts" path="getting-started/src/app/product-details/product-details.component.ts" region="cart-service">
   </code-example>

   1. Inyecte el servicio de carrito agregándolo al `constructor()`.

      <code-example path="getting-started/src/app/product-details/product-details.component.ts" header="src/app/product-details/product-details.component.ts" region="inject-cart-service">
      </code-example>

    <!--
       Para hacer: considere definir "inyectar" y describir el concepto de "inyección de dependencia"
    -->

    1. Defina el método `addToCart()`, que agrega el producto actual al carrito.

    El método `addToCart()` hace las siguientes tres cosas:

    - Recibe el "producto" actual.
    - Utiliza el método `addToCart()` del servicio de carrito para agregar el producto al carrito.
    - Muestra un mensaje de que ha agregado un producto al carrito.

   <code-example path="getting-started/src/app/product-details/product-details.component.ts" header="src/app/product-details/product-details.component.ts" region="add-to-cart"></code-example>

1. Actualice la plantilla de detalles del producto con un botón "Comprar" que agrega el producto actual al carrito.

    1. Abra `product-details.component.html`.

    1. Agregue un botón con la etiqueta "Comprar" y vincule el evento `click()` al método `addToCart()`:

   <code-example header="src/app/product-details/product-details.component.html" path="getting-started/src/app/product-details/product-details.component.html">
   </code-example>

   <div class="alert is-helpful">

   La línea, `<h4> {{product.price | currency}} </h4>` usa el canal `currency` para transformar `product.price` de un número a una cadena de moneda. Una tubería es una forma de transformar datos en su plantilla HTML. Para obtener más información sobre los filtros en angular, consulte [Filtro](guide/pipes "Filtros").

   </div>

1. Para ver el nuevo botón "Comprar", actualice la aplicación y haga clic en el nombre de un producto para mostrar sus detalles.

<div class="lightbox">
  <img src='generated/images/guide/start/product-details-buy.png' alt="Display details for selected product with a Buy button">
</div>

1. Haga clic en el botón "Comprar" para agregar el producto a la lista almacenada de artículos en el carrito y mostrar un mensaje de confirmación.

   <div class="lightbox">
     <img src='generated/images/guide/start/buy-alert.png' alt="Display details for selected product with a Buy button">
   </div>

## Crea la vista del carrito

    En este punto, los usuarios pueden colocar artículos en el carrito haciendo clic en "Comprar", pero aún no pueden ver su carrito.

Cree la vista del carrito en dos pasos:

    1. Cree un componente de carro y configure el enrutamiento al nuevo componente. En este punto, la vista del carrito solo tiene texto predeterminado.
    1. Muestre los artículos del carrito.

### Configurar el componente

    Para crear la vista del carrito, comience siguiendo los mismos pasos que hizo para crear el componente de detalles del producto y configurar el enrutamiento para el nuevo componente.

    1. Genere un componente de carrito, llamado "carrito".

     Recordatorio: En la lista de archivos, haga clic con el botón derecho en la carpeta `app`, elija `Generador Angular` y `Component`.

    <code-example header="src/app/cart/cart.component.ts" path="getting-started/src/app/cart/cart.component.1.ts"></code-example>

    1. Agregue una ruta (un patrón de URL) para el componente del carrito.

     Abra `app.module.ts` y agregue una ruta para el componente `CartComponent`, con una `ruta` de `carrito`:

    <code-example header="src/app/app.module.ts" path="getting-started/src/app/app.module.ts" region="cart-route">
    </code-example>

    1. Actualice el botón "Pagar" para que se dirija a la URL `/cart`.

     Abra `top-bar.component.html` y agregue una directiva `routerLink` apuntando a `/cart`.

    <code-example
        header="src/app/top-bar/top-bar.component.html"
        path="getting-started/src/app/top-bar/top-bar.component.html"
        region="cart-route">
    </code-example>

1. Para ver el nuevo componente del carrito, haga clic en el botón "Pagar". Puede ver el "carrito funciona!" texto predeterminado, y la URL tiene el patrón `https://getting-started.stackblitz.io/cart`, donde `Getting-started.stackblitz.io` puede ser diferente para su proyecto StackBlitz.

   <div class="lightbox">
     <img src='generated/images/guide/start/cart-works.png' alt="Display cart view before customizing">
   </div>

   ### Mostrar los artículos del carrito

   utilizar los servicios para compartir datos entre componentes:

   - El componente de detalles del producto ya utiliza el servicio de carrito para agregar productos al carrito.
   - Esta sección le muestra cómo utilizar el servicio de carrito para mostrar los productos en el carrito.

   1. Abra `cart.component.ts`.

   1. Configure el componente para utilizar el servicio de carrito.

   1. Importe el `CartService` del archivo `cart.service.ts`.

   <code-example header="src/app/cart/cart.component.ts" path="getting-started/src/app/cart/cart.component.2.ts" region="imports">
   </code-example>

   1. Inyecte el `CartService` para que el componente del carrito pueda usarlo.

   <code-example path="getting-started/src/app/cart/cart.component.2.ts" header="src/app/cart/cart.component.ts" region="inject-cart">
   </code-example>

   1. Defina la propiedad `items` para almacenar los productos en el carrito.

   <code-example path="getting-started/src/app/cart/cart.component.2.ts" header="src/app/cart/cart.component.ts" region="items">
   </code-example>

   1. Configure los artículos usando el método `getItems()` del servicio de carrito. Recuerde que definió este método [cuando generó `cart.service.ts`](#generate-cart-service).

   La clase `CartComponent` resultante es la siguiente:

   <code-example path="getting-started/src/app/cart/cart.component.3.ts" header="src/app/cart/cart.component.ts" region="props-services">
   </code-example>

   1. Actualice la plantilla con un encabezado y use un `<div>` con un `*ngFor` para mostrar cada uno de los artículos del carrito con su nombre y precio.

   La plantilla "CartComponent" resultante es la siguiente:

   <code-example header="src/app/cart/cart.component.html" path="getting-started/src/app/cart/cart.component.2.html" region="prices">
   </code-example>

1. Pruebe el componente de su carrito.

   1. Haga clic en "Mi tienda" para ir a la vista de lista de productos.
   1. Haga clic en el nombre de un producto para mostrar sus detalles.
   1. Haga clic en "Comprar" para agregar el producto al carrito.
   1. Haga clic en "Pagar" para ver el carrito.
   1. Para agregar otro producto, haga clic en "Mi tienda" para volver a la lista de productos.

   Repita para agregar más artículos al carrito.

    <div class="lightbox">
      <img src='generated/images/guide/start/cart-page-full.png' alt="Cart view with products added">
    </div>

<div class="alert is-helpful">

Consejo de StackBlitz: cada vez que se actualiza la vista previa, el carrito se borra. Si realiza cambios en la aplicación, la página se actualiza, por lo que deberá volver a comprar productos para completar el carrito.

</div>

<div class="alert is-helpful">

Para obtener más información sobre los servicios, consulte [Introducción a los servicios y la inyección de dependencias](guide/architecture-services "Conceptos> Introducción a los servicios y ID").

</div>

## Recuperar precios de envío

<!-- Accediendo a los datos con el cliente HTTP -->

Los servidores suelen devolver datos en forma de flujo.
Los flujos son útiles porque facilitan la transformación de los datos devueltos y hacen modificaciones a la forma en que solicita esos datos.
El cliente HTTP de Angular, `HttpClient`, es una forma integrada de obtener datos de API externas y proporcionarlos a su aplicación como un flujo.

Esta sección le muestra cómo utilizar el cliente HTTP para recuperar los precios de envío de un archivo externo.

### Datos de envío predefinidos

La aplicación que StackBlitz genera para esta guía viene con datos de envío predefinidos en `assets/shipping.json`.
Utilice estos datos para agregar los precios de envío de los artículos en el carrito.

<code-example header="src/assets/shipping.json" path="getting-started/src/assets/shipping.json">
</code-example>

### Usa `HttpClient` en el `AppModule`

Antes de que pueda usar el cliente HTTP de Angular, debe configurar su aplicación para usar `HttpClientModule`.

El `HttpClientModule` de Angular registra los proveedores que su aplicación necesita para usar una sola instancia del servicio `HttpClient` en toda su aplicación.

1. Abra `app.module.ts`.

   Este archivo contiene importaciones y funciones que están disponibles para toda la aplicación.

1. Importe `HttpClientModule` del paquete `@angular/common/http` en la parte superior del archivo con las otras importaciones. Como hay otras importaciones, este fragmento de código las omite por brevedad. Asegúrese de dejar las importaciones existentes en su lugar.

<code-example header="src/app/app.module.ts" path="getting-started/src/app/app.module.ts" region="http-client-module-import">
</code-example>

1. Agregue `HttpClientModule` a la matriz `AppModule` `@NgModule()` `import` para registrar los proveedores `HttpClient` de Angular a nivel mundial.

<code-example path="getting-started/src/app/app.module.ts" header="src/app/app.module.ts" region="http-client-module">
</code-example>

### Usa `HttpClient` en el servicio de carrito

Ahora que el `AppModule` importa el `HttpClientModule`, el siguiente paso es inyectar el servicio `HttpClient` en su servicio para que su aplicación pueda obtener datos e interactuar con API y recursos externos.

1. Abra `cart.service.ts`.

1. Importe `HttpClient` del paquete `@angular/common/http`.

<code-example header="src/app/cart.service.ts" path="getting-started/src/app/cart.service.ts" region="import-http">
</code-example>

1. Inyecte `HttpClient` en el constructor de `CartService`:

<code-example path="getting-started/src/app/cart.service.ts" header="src/app/cart.service.ts" region="inject-http">
</code-example>

### Definir el método `get()`

Varios componentes pueden aprovechar el mismo servicio.
Más adelante en este tutorial, el componente de envío usa el servicio de carrito para recuperar datos de envío a través de HTTP del archivo `shipping.json`.
Primero, defina un método `get()`.

1. Continúe trabajando en `cart.service.ts`.

1. Debajo del método `clearCart()`, defina un nuevo método `getShippingPrices()` que use el método `HttpClient` `get()` para recuperar los datos de envío.

   <code-example header="src/app/cart.service.ts" path="getting-started/src/app/cart.service.ts" region="get-shipping"></code-example>

<div class="alert is-helpful">

Para obtener más información sobre el `HttpClient` de Angular, consulte la guía [Interacción cliente-servidor](guide/http " Interacción del servidor a través de HTTP").

</div>

## Definir la vista de envío

Ahora que su aplicación puede recuperar datos de envío, cree un componente y una plantilla de envío.

1. Genere un nuevo componente llamado "envío".

   Recordatorio: En la lista de archivos, haga clic con el botón derecho en la carpeta `app`, elija `Angular Generator` y `Component`.

   <code-example header="src/app/shipping/shipping.component.ts" path="getting-started/src/app/shipping/shipping.component.1.ts"></code-example>

1. En `app.module.ts`, agregue una ruta para el envío. Especifique una `ruta` de `envío` y un componente de `ShippingComponent`.

   <code-example header="src/app/app.module.ts" path="getting-started/src/app/app.module.ts" region="shipping-route"></code-example>

   Todavía no hay un enlace al nuevo componente de envío, pero puede ver su plantilla en el panel de vista previa ingresando la URL que especifica su ruta. La URL tiene el patrón: `https://getting-started.stackblitz.io/shipping` donde la parte `Getting-started.stackblitz.io` puede ser diferente para su proyecto StackBlitz.

1. Modifique el componente de envío para que utilice el servicio de carrito para recuperar los datos de envío a través de HTTP del archivo `shipping.json`.

   1. Importe el servicio de carrito.

      <code-example header="src/app/shipping/shipping.component.ts" path="getting-started/src/app/shipping/shipping.component.ts" region="imports"></code-example>

   1. Defina una propiedad `shippingCosts`.
      <code-example path="getting-started/src/app/shipping/shipping.component.ts" header="src/app/shipping/shipping.component.ts" region="props"></code-example>

   1. Inyecte el servicio de carrito en el constructor `ShippingComponent`:

      <code-example path="getting-started/src/app/shipping/shipping.component.ts" header="src/app/shipping/shipping.component.ts" region="inject-cart-service"></code-example>

   1. Establezca la propiedad `shippingCosts` usando el método`getShippingPrices ()`del servicio de carrito.

      <code-example path="getting-started/src/app/shipping/shipping.component.ts" header="src/app/shipping/shipping.component.ts" region="ctor"></code-example>

1. Actualice la plantilla del componente de envío para mostrar los tipos de envío y los precios mediante la canalización `async`:

   <code-example header="src/app/shipping/shipping.component.html" path="getting-started/src/app/shipping/shipping.component.html"></code-example>

   El filtro `async` devuelve el último valor de un flujo de datos y continúa haciéndolo durante la vida útil de un componente determinado. Cuando Angular destruye ese componente, El filtro `async` se detiene automáticamente. Para obtener información detallada sobre la canalización `async`, consulte la [documentación de la API de AsyncPipe](/api/common/AsyncPipe).

1. Agregue un enlace desde la vista del carrito a la vista de envío:
   <code-example header="src/app/cart/cart.component.html" path="getting-started/src/app/cart/cart.component.2.html"></code-example>

1. Pruebe la función de precios de envío:

   Haga clic en el botón "Pagar" para ver el carrito actualizado. Recuerde que cambiar la aplicación hace que la vista previa se actualice, lo que vacía el carrito.

   <div class="lightbox">
     <img src='generated/images/guide/start/cart-empty-with-shipping-prices.png' alt="Cart with link to shipping prices">
   </div>

   Haga clic en el enlace para navegar a los precios de envío.

   <div class="lightbox">
     <img src='generated/images/guide/start/shipping-prices.png' alt="Display shipping prices">
   </div>

## Próximos pasos

¡Felicidades! Tienes una aplicación de tienda online con catálogo de productos y carrito de compras. También puede buscar y mostrar los precios de envío.

Para continuar explorando Angular, elija cualquiera de las siguientes opciones:

- [Continúe a la sección "Formularios"](start/start-forms "Pruébelo: Formularios para entrada de usuario") para finalizar la aplicación agregando la vista del carrito de compras y un formulario de pago.
- [Pase directamente a la sección "Implementación"](start/start-deployment "Pruébelo: Implementación") para pasar al desarrollo local o implementar su aplicación en Firebase o en su propio servidor.
