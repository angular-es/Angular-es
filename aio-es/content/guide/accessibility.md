# Accesibilidad en Angular

La Web es utilizada por muchas personas, incluidas aquellas con discapacidades visuales y motoras.
Existen diversas tecnologías de asistencia que facilitan a las personas el uso de aplicaciones en la Web.
Además, al diseñar su aplicación para que sea más accesible,
Mejorará la experiencia del usuario para todos los usuarios.

Para obtener una introducción en profundidad a los problemas y las técnicas para diseñar aplicaciones accesibles, consulte la sección [Accesibilidad](https://developers.google.com/web/fundamentals/) de los [Fundamentos Web](https://developers.google.com/web/fundamentals/accessibility/#what_is_accessibility) de Google
 

Esta página es fácil de usar para todos los usuarios, incluidos aquellos que necesitan tecnología de asistencia.
Describe las mejores prácticas para diseñar aplicaciones Angular.

<div class="alert is-helpful">

  Para ver la aplicación de ejemplo que describe esta página, consulte el <live-example></live-example>.

</div>

## Atributos de accesibilidad

Para crear accesibilidad en la web, asegúrese de no perderse ninguna información semántica semántica.
Establezca [Atributo ARIA ](https://developers.google.com/web/fundamentals/accessibility/semantics-aria)Utilice la notación de plantillas [enlace de atributo](guide/template-syntax#attribute-binding) para controlar el valor de los atributos relacionados con la accesibilidad.

La especificación ARIA se basa en atributos HTML en lugar de propiedades de elementos DOM.
Use `attr.` como prefijo para enlazar atributos ARIA dentro de Angular.

```html
<!-- use atributo para enlazar atributos ARIA  -->
<button [attr.aria-label]="myActionLabel">...</button>
```

Esta notación solo es necesaria si se 'vincula' un atributo.
No se requiere una notación especial para los atributos ARIA estáticos.

```html
<!-- No se requiere notación especial para atributos ARIA estáticos -->
<button aria-label="Save document">...</button>
```

Observación:

<div class="alert is-helpful">

   Por convención, los nombres de los atributos HTML están en minúsculas (`tabindex`). Por otro lado, camelCase se usa para propiedades (`tabIndex`).

   Consulte la guía [Notación de plantillas](guide/template-syntax#html-attribute-vs-dom-property)para obtener más información sobre la diferencia entre atributos y propiedades.

</div>


## Componente de IU angular

La biblioteca [Material Angular](https://material.angular.io/) mantenida por el equipo de Angular es una colección de componentes de IU reutilizables diseñados para ser accesibles.
El [Kit de desarrollo de componentes (CDK)](https://material.angular.io/cdk/categories) contiene el paquete `a11y`, que proporciona herramientas para admitir la accesibilidad en diversas áreas.
Por ejemplo,

* `LiveAnnouncer` se usa para transmitir un mensaje a los usuarios de lectores de pantalla que usan el área` aria-live`. Para obtener más información, consulte la documentación del W3C [aria-live 領域](https://www.w3.org/WAI/PF/aria-1.1/states_and_properties#aria-live)

* La directiva `cdkTrapFocus` detecta el foco mediante la tecla tab en el elemento. Se utiliza para proporcionar accesibilidad y crear un componente que fuerza el enfoque, como un diálogo modal.

Consulte [Descripción general de accesibilidad de Angular CDK](https://material.angular.io/cdk/a11y/overview) para obtener más información sobre las herramientas anteriores y otras.


### Reforzar elementos nativos

Los elementos HTML nativos capturan muchos patrones de comportamiento estándar que son importantes para la accesibilidad.
Al crear componentes angulares, reutilice estos elementos nativos lo más directamente posible en lugar de volver a implementar el comportamiento ya admitido.

Por ejemplo, en lugar de crear elementos personalizados para botones nuevos y diferentes, puede crear un componente que use un elemento nativo `<button>` para su selector de atributos.
Esto generalmente se aplica a `<button>` y `<a>`, pero podría usarse para muchos otros tipos de elementos.

En Angular Material, la muestra de patrón anterior es [`MatButton`](https://github.com/angular/components/blob/master/src/material/button/button.ts#L66-L68) y [`MatTabNav`](https://github.com/angular/components/blob/master/src/material/tabs/tab-nav-bar/tab-nav-bar.ts#L67) 、[`MatTable`](https://github.com/angular/components/blob/master/src/material/table/table.ts#L17).

### Usar contenedor para elemento nativo

Se pueden requerir elementos de contenedor para usar el elemento nativo apropiado.
Por ejemplo, el elemento nativo `<input>` no puede tener elementos secundarios.
Por lo tanto, un componente de entrada de texto personalizado debe encerrar el `<input>` en elementos adicionales.
Si agrega `<input>` como está dentro del componente personalizado Plantillas,
No podrá establecer propiedades o atributos arbitrarios en el elemento de entrada cuando utilice el componente.
En cambio, al crear un componente contenedor con proyección de contenido
El control nativo es posible con la API del componente.

Un ejemplo de este patrón es [`MatFormField`](https://material.angular.io/components/form-field/overview).

## Estudio de caso: Implemente su propia barra de progreso

El siguiente ejemplo muestra cómo crear una barra de progreso simple utilizando enlaces de host para controlar los atributos relacionados con la accesibilidad.

* Este componente define un elemento accesible con el atributo estándar HTML `role` y el atributo ARIA. El atributo ARIA `aria-valuenow` se basa en la entrada del usuario.

  <code-example path="accessibility/src/app/progress-bar.component.ts" header="src/app/progress-bar.component.ts" region="progressbar-component"></code-example>


* En estas Plantillas, el atributo `aria-label` permite el control desde los lectores de pantalla.

  <code-example path="accessibility/src/app/app.component.html" header="src/app/app.component.html" region="template"></code-example>


## Enrutamiento y control de enfoque

Enrutamiento y gestión del enfoque [enfoque](https://developers.google.com/web/fundamentals/accessibility/focus/) en la interfaz de usuario es una consideración importante al diseñar la accesibilidad.
Cuando utilice el enrutamiento angular, debe decidir dónde estará el enfoque de la página cuando la pantalla pase.

Asegúrese de que las actualizaciones de su código de enrutamiento se centren después de las transiciones de página, para evitar depender únicamente de señales visuales.
Para saber cuándo actualizar el enfoque,
Utilice el evento `NavigationEnd` del servicio` Router`.

El siguiente ejemplo muestra cómo encontrar y enfocarse en el encabezado del contenido principal en el DOM después de una transición de pantalla.

`` `ts

router.events.pipe(filter(e => e instanceof NavigationEnd)).subscribe(() => {
  const mainHeader = document.querySelector('#main-content-header')
  if (mainHeader) {
    mainHeader.focus();
  }
});

```
En una aplicación real, el elemento enfocado depende de la estructura y el diseño de la aplicación.
El elemento enfocado es el principal dirigido a la vista
Los usuarios deben colocarse donde puedan acceder al contenido.
Debe evitar situaciones en las que el foco vuelva al elemento `body` después de que cambie la ruta.


## Materiales de referencia

* [Accesibilidad - Fundamentos Web de Google](https://developers.google.com/web/fundamentals/accessibility)

* [Especificación ARIA y prácticas de autor](https://www.w3.org/TR/wai-aria/)

* [Diseño Material- Accesibilidad](https://material.io/design/usability/accessibility.html)

* [Revista sensacional](https://www.smashingmagazine.com/search/?q=accessibility)

* [Inclusive Components](https://inclusive-components.design/)

* [Recursos de accesibilidad y ejemplos de código](https://dequeuniversity.com/resources/)

* [W3C - Iniciativa de accesibilidad web](https://www.w3.org/WAI/people-use-web/)

* [Rob Dodson A11ycasts](https://www.youtube.com/watch?v=HtTyRajRuyY)

* [Codelyzer](http://codelyzer.com/rules/) Proporciona reglas Lint para ayudar a garantizar que se cumplan los estándares de accesibilidad.

Libros

* "Una web para todos: diseño de experiencias de usuario accesibles", Sarah Horton y Whitney Quesenbery

* "Patrones de diseño inclusivo", Heydon Pickering

## Más accesibilidad

Lo siguiente puede ser útil.
* [Verifique la accesibilidad de la aplicación Angular usando codelyzer](https://web.dev/accessible-angular-with-codelyzer/)。
