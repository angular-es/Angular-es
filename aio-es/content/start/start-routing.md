# Navegación en la aplicación

Al final de la [parte 1](start "Empiece con una aplicación angular básica"), la aplicación de la tienda en línea tiene un catálogo básico de productos.
La aplicación no tiene estados variables ni navegación.
Hay una URL, y esa URL siempre muestra la página "Mi tienda" con una lista de productos y sus descripciones.

Esta guía le muestra cómo usar Angular [enrutamiento](guide/glossary#router "Definición de enrutador") para brindarle al usuario navegación dentro de la aplicación. En una aplicación de una sola página, en lugar de cargar páginas nuevas, le muestra diferentes componentes y datos al usuario en función de dónde se encuentra el usuario en la aplicación.

El enrutador le permite mostrar detalles completos del producto en [vistas](guide/glossary#view "Definición de vista") separadas, cada una con su propia URL. El enrutamiento permite la navegación de una vista a la siguiente (dentro de la misma página) cuando los usuarios realizan tareas como las siguientes:

- Ingresando una URL en la barra de direcciones para navegar a la vista correspondiente.
- Hacer clic en los enlaces de la página para navegar a una nueva vista.
- Hacer clic en los botones de avance y retroceso del navegador para navegar hacia atrás y hacia adelante a través del historial del navegador.

## Registrar una ruta

La aplicación ya está configurada para usar el `Enrutador` angular y para usar el enrutamiento para navegar al componente de la lista de productos que modificó anteriormente. Esta sección le muestra cómo definir una ruta para mostrar detalles de productos individuales.

1. Genere un nuevo componente para los detalles del producto. Asigne al componente el nombre "detalles del producto".

   Recordatorio: En la lista de archivos, haga clic con el botón derecho en la carpeta `app`, elija `Angular Generator` y `Component`.

1. En `app.module.ts`, agregue una ruta para los detalles del producto, con `ruta` de `products/:productId` y `ProductDetailsComponent` para el `componente`.

   <code-example header="src/app/app.module.ts" path="getting-started/src/app/app.module.ts" region="product-details-route">
   </code-example>

   A route associates one or more URL paths with a component.

1. The directive configures the component template to define how the user navigates to the route or URL. When the user clicks a product name, the app displays the details for that product.

   1. Open `product-list.component.html`.

   1. Update the `*ngFor` directive to assign each index in the `products` array to the `productId` variable when iterating over the list.

   1. Modify the product name anchor to include a `routerLink`.

   <code-example header="src/app/product-list/product-list.component.html" path="getting-started/src/app/product-list/product-list.component.html" region="router-link">
   </code-example>

   La directiva RouterLink le da al enrutador control sobre el elemento de anclaje. En este caso, la ruta, o URL, contiene un segmento fijo, `/productos`, mientras que el segmento final es variable, insertando la propiedad id del producto actual. Por ejemplo, la URL de un producto con un `id` de 1 será similar a `https://getting-started-myfork.stackblitz.io/products/1`.

1. Pruebe el enrutador haciendo clic en el nombre de un producto. La aplicación muestra el componente de detalles del producto, que actualmente siempre dice "¡los detalles del producto funcionan!"

   Observe que cambia la URL en la ventana de vista previa. El segmento final es `products/#` donde `#` es el número de la ruta en la que hizo clic.

   <div class="lightbox">
     <img src="generated/images/guide/start/product-details-works.png" alt="Product details view with updated URL">
   </div>

## Usando información de ruta

El componente de detalles del producto maneja la exhibición de cada producto. El enrutador angular muestra componentes basados en la URL del navegador y sus rutas definidas. Esta sección le muestra cómo usar el enrutador angular para combinar los datos de `productos` y la información de ruta para mostrar los detalles específicos de cada producto.

1. Abra `product-details.component.ts`

1. Disponga el uso de datos de productos de un archivo externo.

   1. Importe `ActivatedRoute` del paquete `@angular/router` y el arreglo `products` de `../products`.

   <code-example header="src/app/product-details/product-details.component.ts" path="getting-started/src/app/product-details/product-details.component.1.ts" region="imports">
   </code-example>

   1. Defina la propiedad `product` e inyecte el `ActivatedRoute` en el constructor agregándolo como un argumento dentro de los paréntesis del constructor.

      <code-example header="src/app/product-details/product-details.component.ts" path="getting-started/src/app/product-details/product-details.component.1.ts" region="props-methods">
      </code-example>

      El `ActivatedRoute` es específico para cada componente enrutado que carga el enrutador angular. Contiene información sobre el
      ruta, sus parámetros y datos adicionales asociados con la ruta.

      Al inyectar el `ActivatedRoute`, está configurando el componente para usar un _service_. La página [Gestión de datos](start/start-data "Pruébelo: Gestión de datos") cubre los servicios con más detalle.

1) En el método `ngOnInit()`, suscríbase a los parámetros de ruta y obtenga el producto basándose en el `productId`.

   <code-example path="getting-started/src/app/product-details/product-details.component.1.ts" header="src/app/product-details/product-details.component.ts" region="get-product">
   </code-example>

   Los parámetros de la ruta corresponden a las variables de ruta que define en la ruta. La URL que coincide con la ruta proporciona el "productId". Angular usa el `productId` para mostrar los detalles de cada producto único.

1) Actualice la plantilla para mostrar información de detalles del producto dentro de un `*ngIf`.

<code-example header="src/app/product-details/product-details.component.html" path="getting-started/src/app/product-details/product-details.component.html" region="details">
</code-example>

Ahora, cuando los usuarios hacen clic en un nombre en la lista de productos, el enrutador los dirige a la URL distinta del producto, cambia el componente de la lista de productos por el componente de detalles del producto y muestra los detalles del producto.

<div class="lightbox">
  <img src="generated/images/guide/start/product-details-routed.png" alt="Product details page with updated URL and full details displayed">
</div>

<div class="alert is-helpful">

Para obtener más información sobre el enrutador angular, consulte [Enrutamiento y navegación](guide/router "Guía de enrutamiento y navegación").

</div>

## Próximos pasos

¡Felicidades! Has integrado el enrutamiento en tu tienda online.

- Los productos están vinculados desde la vista de lista de productos a productos individuales.
- Los usuarios pueden hacer clic en el nombre de un producto de la lista para ver los detalles en una nueva vista, con una URL/ruta distinta.

Para continuar explorando Angular, elija cualquiera de las siguientes opciones:

- [Continúe con la sección "Administración de datos"](start/start-data "Pruébelo: Administración de datos") para agregar una función de carrito de compras, use un servicio para administrar los datos del carrito y use HTTP para recuperar datos externos para los precios de envío .
- [Vaya a la sección Implementación](start/start-deployment "Pruébelo: Implementación") para implementar su aplicación en Firebase o pasar al desarrollo local.
