# Descripción general del Cli y Referencias de comandos

El de CLI angular también se puede utilizar indirectamente a través de una interfaz de usuario interactiva como Angular , [Consola Angular] (https://angularconsole.com).

## Instalar CLI angular

La versión principal de Angular CLI sigue a la versión principal compatible de Angular, pero las versiones menores se pueden lanzar por separado.

Instale la CLI utilizando el administrador de paquetes `npm`:
<code-example language = "bash">
npm install -g @ angular / cli
</code-example>

Para obtener más información sobre los cambios entre versiones y actualizaciones de versiones anteriores, 
Consulte la pestaña Publicaciones en GitHub: https://github.com/angular/angular-cli/releases

## Flujo de trabajo básico

Invoque la herramienta a través de `ng` que se puede ejecutar desde la línea de comandos.
La ayuda en línea está disponible en la línea de comando.
Para enumerar un comando específico (como [generate] (cli / generate)) u opción con una breve descripción, escriba:

<code-example language = "bash">
ng ayuda
ng generate --help
</code-example>

Para crear, construir y servir un nuevo proyecto angular básico en su servidor de desarrollo, vaya al directorio principal de su nuevo espacio de trabajo y use el siguiente comando:

<code-example language = "bash">
ng nuevo mi primer proyecto
cd mi primer proyecto
ng servir
</code-example>

Abra http: // localhost: 4200 / en su navegador y vea cómo se ejecuta la nueva aplicación.
Cuando construyo mi aplicación usando el comando [ng serve] (cli / serve) y la entrego localmente, cuando cambio cualquiera de los archivos de origen, el servidor reconstruye automáticamente la aplicación y vuelve a cargar la página. Voy a.

<div class = "alert es útil">

Ejecutar `ng new my-first-project` creará una nueva carpeta llamada` my-first-project` en su directorio de trabajo. Asegúrese de tener permisos suficientes en su directorio de trabajo antes de ejecutar este comando, ya que creará archivos en esta carpeta.

Si su directorio de trabajo no es la ubicación correcta para su proyecto, muévase a la ubicación correcta con el comando `cd <path-to-other-directory>` de antemano.

</div>

## Espacio de trabajo y archivos de proyecto

El comando [ng new] (cli / new) crea la carpeta * Angular workspace * y crea el esqueleto de la nueva aplicación.
Un espacio de trabajo puede contener múltiples aplicaciones y bibliotecas.
La primera aplicación creada por el comando [ng new] (cli / new) está en la parte superior del espacio de trabajo.
Si genera aplicaciones o bibliotecas adicionales en su espacio de trabajo, estarán en la subcarpeta `projects /`.

La aplicación recién generada contiene los archivos fuente del módulo raíz que contienen los componentes y las plantillas raíz.
Cada aplicación tiene una carpeta `src` que contiene lógica, datos y activos.

Puede editar el archivo generado directamente o agregarlo y modificarlo utilizando los comandos de la CLI.
Use el comando [ng generate] (cli / generate) para agregar nuevos archivos para componentes o servicios adicionales, o agregue código como nuevas tuberías o directivas.
Los comandos como [add] (cli / add) y [generate] (cli / generate) que crean o manipulan aplicaciones y bibliotecas deben ejecutarse desde el espacio de trabajo o la carpeta del proyecto.

* Consulte los detalles sobre [Espacio de trabajo y estructura de archivos del proyecto] (guía / estructura de archivos).

### Espacio de trabajo y estructura del proyecto

Se crea un archivo de configuración del espacio de trabajo `angular.json` en el nivel superior del espacio de trabajo.
Aquí puede establecer los valores predeterminados por proyecto para las opciones de comando de la CLI y especificar la configuración que la CLI usará al crear el proyecto para diferentes objetivos.

Puede usar el comando [ng config] (cli / config) para establecer y obtener valores de configuración desde la línea de comandos. Alternativamente, puede editar el archivo `angular.json` directamente.
Debe usar [camelCase] ​​(guía / glosario # tipos de caso) como el nombre de la opción en el archivo de configuración, pero puede usar camelCase o dashcase como el nombre de la opción en el comando.

* [Configuración del espacio de trabajo] (guide / workspace-config) Ver detalles sobre la configuración del espacio de trabajo.
* Vea el [esquema completo] de `angular.json` (https://github.com/angular/angular-cli/wiki/angular-workspace).

## Sintaxis del lenguaje de comando CLI

La sintaxis del comando es:

`ng` * commandNameOrAlias ​​* * requiredArg * [* optionalArg *]` [opciones] `

* La mayoría de los comandos y algunas opciones tienen alias. Los alias se muestran en la declaración de sintaxis para cada comando.

* Un guión doble (-) precede al nombre de la opción.
    Los alias de opciones tienen como prefijo un solo guión (-).
    No se anteponen argumentos.
    Por ejemplo:
    <code-example language = "bash">
        ng build my-app -c production
    </code-example>

* Generalmente, el nombre del artefacto generado puede especificarse como un argumento para el comando o con la opción --name.

* Los nombres de argumentos y opciones son
Se puede especificar en [camelCase o dash-case] (guía / glosario # case-types).
`--myOptionName` es lo mismo que` --my-option-name`.

### Opciones booleanas y enum

Las opciones booleanas tienen dos formas: `--thisOption` establece una bandera y` --noThisOption` borra una bandera.
Si no se especifica ninguna de las opciones, los indicadores permanecerán en los valores predeterminados que se enumeran en la documentación de referencia.

Los valores permitidos se enumeran para cada descripción de opción enumerada y los valores predeterminados se muestran en ** negrita **.

### camino relativo

Las opciones que especifican archivos se pueden especificar como rutas absolutas o relativas al directorio de trabajo actual (generalmente, el espacio de trabajo o la raíz del proyecto).

### Esquemas

Los comandos [ng generate] (cli / generate) y [ng add] (cli / add) toman un argumento para agregar un artefacto o biblioteca al proyecto actual
Además de las opciones generales, cada artefacto o biblioteca define sus propias opciones en * esquemas *.
Las opciones esquemáticas se proporcionan al comando en el mismo formato que las opciones de comando inmediato.