# Próximos pasos: herramientas y técnicas

Una vez que comprenda los bloques de construcción angulares básicos, puede obtener más información
sobre las funciones y herramientas que pueden ayudarlo a desarrollar y entregar aplicaciones Angular.

* Trabaja en el tutorial [Tour de héroes](tutorial) para tener una idea de cómo unir los bloques de construcción básicos para crear una aplicación bien diseñada.

* Consulte el [Glosario](guide/glossary) para comprender los términos y el uso específicos de Angular.

* Utilice la documentación para conocer las características clave con mayor profundidad, según su etapa de desarrollo y áreas de interés.

## Arquitectura de la aplicación

* La guía [Componentes y plantillas](guide/displaying-data) explica cómo conectar los datos de la aplicación en sus [componentes](guide/glossary#component) a su pantalla de página [plantillas](guide/glossary#template), para crear una aplicación interactiva completa.

* La guía [NgModules](guide/ngmodules) proporciona información detallada sobre la estructura modular de una aplicación Angular.

* La guía [Enrutamiento y navegación](guide/router) proporciona información detallada sobre cómo crear aplicaciones que permitan al usuario navegar a diferentes [vistas](guide/glossary#view)  dentro de su aplicación de una sola página.

* La guía [Inyección de dependencia](guide/dependency-injection) proporciona información detallada sobre cómo construir una aplicación de modo que cada clase de componente pueda adquirir los servicios y objetos que necesita para realizar su función.

## Programación receptiva

La guía **Componentes y plantillas** proporciona orientación y detalles de la [sintaxis de la plantilla](guide/template-syntax)  que utiliza para mostrar los datos de sus componentes cuando y donde los desee dentro de una vista, y para recopilar información de los usuarios. al que puedes responder.

Las páginas y secciones adicionales describen algunas técnicas básicas de programación para aplicaciones Angular.

* [Lifecycle hooks](guide/lifecycle-hooks): aproveche los momentos clave en la vida útil de un componente, desde su creación hasta su destrucción, mediante la implementación de las interfaces de enlace del ciclo de vida.

* [Observables y procesamiento de eventos](guide/observables): Cómo usar observables con componentes y servicios para publicar y suscribirse a mensajes de cualquier tipo, como eventos de interacción del usuario y resultados de operaciones asincrónicas.

* [Elementos angular](guide/elements): Cómo empaquetar componentes como *elementos personalizados* usando Web Components, un estándar web para definir nuevos elementos HTML de una manera independiente del marco.

* [Formularios](guide/forms-overview): admite escenarios de entrada de datos complejos con validación de entrada basada en HTML.

* [Animaciones](guide/forms-overview): use la biblioteca de animación de Angular para animar el comportamiento de los componentes
sin un conocimiento profundo de técnicas de animación o CSS.

## Interacción cliente-servidor

Angular proporciona un marco para aplicaciones de una sola página, donde la mayor parte de la lógica y los datos residen en el cliente.
La mayoría de las aplicaciones aún necesitan acceder a un servidor usando el `HttpClient` para acceder y guardar datos.
Para algunas plataformas y aplicaciones, es posible que también desee utilizar el modelo PWA (aplicación web progresiva) para mejorar la experiencia del usuario.

* [HTTP](guide/http): comunicarse con un servidor para obtener datos, guardar datos e invocar acciones del lado del servidor con un cliente HTTP.

* [Representación del lado del servidor](guide/universal): Angular Universal genera páginas de aplicaciones estáticas en el servidor a través de la representación del lado del servidor (SSR). Esto le permite ejecutar su aplicación Angular en el servidor para mejorar el rendimiento y mostrar la primera página rápidamente en dispositivos móviles y de baja potencia, y también facilitar los rastreadores web.

* [Trabajadores del servicio y PWA](guide/service-worker-intro): utilice un trabajador del servicio para reducir la dependencia de la red y mejorar significativamente la experiencia del usuario.

* [Trabajadores web "Web workers"](guide/web-worker): aprenda a ejecutar cálculos con uso intensivo de CPU en un hilo en segundo plano.

## Soporte para el ciclo de desarrollo

La sección **Flujo de trabajo de desarrollo** describe las herramientas y los procesos que usa para compilar, probar e implementar aplicaciones de Angular.

* [Referencia de comandos de CLI](cli): Angular CLI es una herramienta de línea de comandos que se utiliza para crear proyectos, generar código de aplicaciones y bibliotecas, y realizar una variedad de tareas de desarrollo en curso, como pruebas, agrupación e implementación.

* [Compilación](guide/aot-compiler): Angular proporciona compilación Just-In-Time (JIT) para el entorno de desarrollo y compilación anticipada (AOT) para el entorno de producción.

* [Plataforma de prueba](guide/testing): Ejecute pruebas unitarias en las partes de su aplicación mientras interactúan con el marco Angular.

* [Implementación](guide/deployment): aprenda técnicas para implementar su aplicación Angular en un servidor remoto.

* [Pautas de seguridad](guide/security): Conozca las protecciones integradas de Angular contra vulnerabilidades y ataques comunes de aplicaciones web, como ataques de secuencias de comandos entre sitios.

* [Internacionalización](guide/i18n): haga que su aplicación esté disponible en varios idiomas con las herramientas de internacionalización (i18n) de Angular.

* [Accesibilidad](guide/accessibility): haga que su aplicación sea accesible para todos los usuarios.

## Estructura de archivos, configuración y dependencias

* [Espacio de trabajo y estructura de archivos](guide/file-structure): Comprenda la estructura del espacio de trabajo angular y las carpetas de proyectos.

* [Construir y servir](guide/build): aprenda a definir diferentes configuraciones de servidores proxy y de compilación para su proyecto, como desarrollo, preparación y producción.

* [paquetes npm](guide/npm-packages): Angular Framework, Angular CLI y los componentes utilizados por las aplicaciones Angular se empaquetan como paquetes [npm](https://docs.npmjs.com/) y se distribuyen a través de npm registro. La CLI de Angular crea un archivo `package.json` predeterminado, que especifica un conjunto inicial de paquetes que funcionan bien juntos y son compatibles con muchos escenarios de aplicaciones comunes.

* [Configuración de TypeScript](guide/typescript-configuration): TypeScript es el lenguaje principal para el desarrollo de aplicaciones Angular.

* [Soporte de navegador](guide/browser-support): haga que sus aplicaciones sean compatibles en una amplia gama de navegadores.

## Extensión angular

* [Bibliotecas angulares](guide/libraries): aprenda a usar y crear bibliotecas reutilizables.

* [Esquemas](guide/schematics): aprenda a personalizar y ampliar las capacidades de generación de la CLI.

* [Constructores de CLI](guide/cli-builder): aprenda a personalizar y ampliar la capacidad de la CLI para aplicar herramientas para realizar tareas complejas, como crear y probar aplicaciones.
