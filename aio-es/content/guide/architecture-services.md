# Introducción a los servicios y inyección de dependencia (DI "dependency injection")

*Servicio* es una categoría amplia que abarca cualquier valor, función o característica que necesite una aplicación.
Un servicio es típicamente una clase con un propósito limitado y bien definido.
Debería hacer algo específico y hacerlo bien.

Angular distingue los componentes de los servicios para aumentar la modularidad y la reutilización.
Al separar la funcionalidad relacionada con la vista de un componente de otros tipos de procesamiento,
puede hacer que sus clases de componentes sean ágiles y eficientes.

Idealmente, el trabajo de un componente es permitir la experiencia del usuario y nada más.
Un componente debe presentar propiedades y métodos para el enlace de datos,
para mediar entre la vista (representada por la plantilla)
y la lógica de la aplicación (que a menudo incluye alguna noción de *modelo*).

Un componente puede delegar ciertas tareas a los servicios, como obtener datos del servidor,
validar la entrada del usuario o iniciar sesión directamente en la consola.
Al definir tales tareas de procesamiento en una *clase de servicio inyectable*, hace que esas tareas
disponible para cualquier componente.
También puede hacer que su aplicación sea más adaptable inyectando diferentes proveedores del mismo tipo de servicio,
según corresponda en diferentes circunstancias.

Angular no *aplica* estos principios. Angular te ayuda a *seguir* estos principios
al facilitar la integración de la lógica de su aplicación en los servicios y hacer que esos servicios
disponible para componentes a través de *inyección de dependencia*.

## Ejemplos de servicios

A continuación, se muestra un ejemplo de una clase de servicio que se registra en la consola del navegador.

<code-example path="architecture/src/app/logger.service.ts" header="src/app/logger.service.ts (class)" region="class"></code-example>

Los servicios pueden depender de otros servicios. Por ejemplo, aquí hay un `HeroService` que depende del servicio `Logger`, y también usa `BackendService` para obtener héroes. Ese servicio, a su vez, podría depender del servicio `HttpClient` para buscar héroes de forma asíncrona desde un servidor.

<code-example path="architecture/src/app/hero.service.ts" header="src/app/hero.service.ts (class)" region="class"></code-example>

## Inyección de dependencia (DI)

<img src="generated/images/guide/architecture/dependency-injection.png" alt="Service" class="left">

DI está conectado al marco Angular y se usa en todas partes para proporcionar nuevos componentes con los servicios u otras cosas que necesitan.
Los componentes consumen servicios; es decir, puede *inyectar* un servicio en un componente, dándole acceso al componente a esa clase de servicio.

Para definir una clase como un servicio en Angular, use el decorador `@Injectable()` para proporcionar los metadatos que permiten a Angular inyectarlo en un componente como una *dependencia*.
De manera similar, use el decorador `@Injectable()` para indicar que un componente u otra clase (como otro servicio, una tubería o un NgModule) *tiene* una dependencia.

* El *inyector* es el mecanismo principal. Angular crea un inyector para toda la aplicación durante el proceso de arranque e inyectores adicionales según sea necesario. No es necesario crear inyectores.

* Un inyector crea dependencias y mantiene un *contenedor* de instancias de dependencia que reutiliza si es posible.

* Un *proveedor* es un objeto que le dice a un inyector cómo obtener o crear una dependencia.

Para cualquier dependencia que necesite en su aplicación, debe registrar un proveedor con el inyector de la aplicación,
para que el inyector pueda utilizar el proveedor para crear nuevas instancias.
Para un servicio, el proveedor suele ser la propia clase de servicio.

<div class="alert is-helpful">

Una dependencia no tiene por qué ser un servicio&mdash; podría ser una función, por ejemplo, o un valor.

</div>

Cuando Angular crea una nueva instancia de una clase de componente, determina qué servicios u otras dependencias necesita ese componente al observar los tipos de parámetros del constructor. Por ejemplo, el constructor de `HeroListComponent` necesita `HeroService`.

<code-example path="architecture/src/app/hero-list.component.ts" header="src/app/hero-list.component.ts (constructor)" region="ctor"></code-example>

Cuando Angular descubre que un componente depende de un servicio, primero verifica si el inyector tiene instancias existentes de ese servicio. Si una instancia de servicio solicitada aún no existe, el inyector crea una utilizando el proveedor registrado y la agrega al inyector antes de devolver el servicio a Angular.

Cuando todos los servicios solicitados se han resuelto y devuelto, Angular puede llamar al constructor del componente con esos servicios como argumentos.

El proceso de inyección de `HeroService` se parece a esto.

<div class="lightbox">
  <img src="generated/images/guide/architecture/injector-injects.png" alt="Service" class="left">
</div>

### Prestación de servicios

Debe registrar al menos un *proveedor* de cualquier servicio que vaya a utilizar.
El proveedor puede formar parte de los propios metadatos del servicio, haciendo que ese servicio esté disponible en todas partes.
o puede registrar proveedores con módulos o componentes específicos.
Registra proveedores en los metadatos del servicio (en el decorador `@Injectable()`),
o en los metadatos `@NgModule()` o `@Component()`

* De forma predeterminada, el comando Angular CLI [`ng generate service`](cli/generate) registra un proveedor con el inyector raíz para su servicio al incluir metadatos del proveedor en el decorador` @Injectable() `. El tutorial usa este método para registrar el proveedor de la definición de clase HeroService.

   ```
   @Injectable({
    providedIn: 'root',
   })
   ```

   Cuando proporciona el servicio en el nivel raíz, Angular crea una instancia única y compartida de `HeroService`
    y lo inyecta en cualquier clase que lo solicite.
    El registro del proveedor en los metadatos `@Injectable()` también permite a Angular optimizar una aplicación
    eliminando el servicio de la aplicación compilada si no se utiliza.

* Cuando registra un proveedor con un [NgModule específico](guide/architecture-modules), la misma instancia de un servicio está disponible para todos los componentes en ese NgModule. Para registrarse en este nivel, use la propiedad `Providers` del decorador` @NgModule() `,

   ```
   @NgModule({
     providers: [
     BackendService,
     Logger
    ],
    ...
   })
   ```

* Cuando registra un proveedor a nivel de componente, obtiene una nueva instancia del
service con cada nueva instancia de ese componente.
A nivel de componente, registre un proveedor de servicios en la propiedad `Providers` de los metadatos `@Component()`.

   <code-example path="architecture/src/app/hero-list.component.ts" header="src/app/hero-list.component.ts (component providers)" region="providers"></code-example>

Para obtener información más detallada, consulte la sección [Inyección de dependencia](guide/dependency-injection).
