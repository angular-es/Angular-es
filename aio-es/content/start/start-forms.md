# Pruébelo: use formularios para la entrada del usuario

Al final de [Gestión de datos](start/start-data "Pruébelo: Gestión de datos"), la aplicación de la tienda en línea tiene un catálogo de productos y un carrito de compras.

Esta sección lo guía para agregar una función de pago basada en formularios para recopilar información del usuario como parte del pago.

Esta sección lo guía para agregar una función de pago basada en formularios para recopilar información del usuario como parte del pago.

## Formularios en Angular

Los formularios en Angular se basan en los formularios HTML estándar para ayudarlo a crear controles de formulario personalizados y experiencias de validación fáciles. Hay dos partes en un formulario Reactivo Angular: los objetos que viven en el componente para almacenar y administrar el formulario, y la visualización del formulario que vive en la plantilla.

## Definir el modelo de formulario de pago

Primero, configure el modelo de formulario de pago. Definido en la clase de componente, el modelo de formulario es la fuente de verdad para el estado del formulario.

1. Abra `cart.component.ts`.

1. El servicio `FormBuilder` de Angular proporciona métodos convenientes para generar controles. Al igual que con los otros servicios que ha utilizado, debe importar e inyectar el servicio antes de poder utilizarlo:

    1. Importe el servicio `FormBuilder` del paquete `@angular/forms`.

      <code-example header="src/app/cart/cart.component.ts" path="getting-started/src/app/cart/cart.component.ts" region="imports">
      </code-example>

    El `ReactiveFormsModule` proporciona el servicio `FormBuilder`, que `AppModule` (en `app.module.ts`) ya importa.

    1. Inyecte el servicio `FormBuilder`.

      <code-example header="src/app/cart/cart.component.ts" path="getting-started/src/app/cart/cart.component.ts" region="inject-form-builder">
      </code-example>

1. Aún en la clase `CartComponent`, defina la propiedad `checkoutForm` para almacenar el modelo de formulario.

<code-example header="src/app/cart/cart.component.ts" path="getting-started/src/app/cart/cart.component.ts" region="checkout-form">
</code-example>

1. Para recopilar el nombre y la dirección del usuario, configure la propiedad `checkoutForm` con un modelo de formulario que contenga los campos `nombre` y `dirección`, utilizando el método `FormBuilder` `group()`. Agrega esto entre las llaves, `{}`,
    del constructor.

        <code-example header="src/app/cart/cart.component.ts" path="getting-started/src/app/cart/cart.component.ts" region="checkout-form-group"></code-example>

1. Para el proceso de pago, los usuarios deben enviar su nombre y dirección. Cuando envían su pedido, el formulario debe reiniciarse y el carrito debe limpiarse.

    1. En `cart.component.ts`, defina un método `onSubmit()` para procesar el formulario. Utilice el método `CartService` `clearCart()` para vaciar los elementos del carrito y restablecer el formulario después de su envío. En una aplicación del mundo real, este método también enviaría los datos a un servidor externo. Toda la clase de componentes del carrito es la siguiente:

    <code-example header="src/app/cart/cart.component.ts" path="getting-started/src/app/cart/cart.component.ts">
    </code-example>

Ahora que ha definido el modelo de formulario en la clase de componente, necesita un formulario de pago para reflejar el modelo en la vista.

## Crea el formulario de pago

Utilice los siguientes pasos para agregar un formulario de pago en la parte inferior de la vista "Carrito".

1. Abra `cart.component.html`.

1. En la parte inferior de la plantilla, agregue un formulario HTML para capturar la información del usuario.

1. Utilice un enlace de propiedad `formGroup` para vincular el `checkoutForm` a la etiqueta `form` en la plantilla. También incluye un botón "Comprar" para enviar el formulario.

  <code-example header="src/app/cart/cart.component.html" path="getting-started/src/app/cart/cart.component.3.html" region="checkout-form">
  </code-example>

1. En la etiqueta `form`, use un enlace de evento `ngSubmit` para escuchar el envío del formulario y llame al método `onSubmit()` con el valor `checkoutForm`.

  <code-example path="getting-started/src/app/cart/cart.component.html" header="src/app/cart/cart.component.html (cart component template detail)" region="checkout-form-1">
  </code-example>

1. Agregue campos de entrada para "nombre" y "dirección". Utilice el enlace de atributo `formControlName` para vincular los controles de formulario `checkoutForm` para `nombre` y `dirección` a sus campos de entrada. El componente final completo es el siguiente:

  <code-example path="getting-started/src/app/cart/cart.component.html" header="src/app/cart/cart.component.html" region="checkout-form-2">
  </code-example>

Después de poner algunos artículos en el carrito, los usuarios ahora pueden revisar sus artículos, ingresar su nombre y dirección y enviar su compra:

<div class="lightbox">
  <img src='generated/images/guide/start/cart-with-items-and-form.png' alt="Cart view with checkout form">
</div>

Para confirmar el envío, abra la consola donde debería ver un objeto que contiene el nombre y la dirección que envió.

## Próximos pasos

¡Felicidades! Tiene una aplicación de tienda en línea completa con un catálogo de productos, un carrito de compras y una función de pago.

[Continúe con la sección "Implementación"](start/start-deployment "Pruébelo: Implementación") para pasar al desarrollo local o implementar su aplicación en Firebase o en su propio servidor.
