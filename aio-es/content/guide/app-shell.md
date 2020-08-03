# Shell de la aplicación

El shell de la aplicación es una forma de representar una parte de su aplicación a través de una única ruta en el momento de la compilación.
Inicie rápidamente páginas representadas estáticamente (esqueletos comunes a todas las páginas) hasta que el navegador descargue la versión completa del cliente, cargue ese código y luego cambie automáticamente a la experiencia del usuario. Puede ser mejorado.

Esto facilita a los navegadores procesar HTML y CSS sin tener que inicializar JavaScript, lo que permite a los usuarios ver rápidamente una primera representación significativa de la aplicación.

Obtenga más información en [Modelo de Shell de aplicación] (https://developers.google.com/web/fundamentals/architecture/app-shell).

## Paso 1: Prepare la aplicación

Para hacer esto, use el siguiente comando CLI.
<code-example language = "bash">
ng new my-app: enrutamiento
</code-example>

Las aplicaciones existentes necesitarán agregar manualmente el `RouterModule` y definir el` <router-outlet> `dentro de la aplicación.

## Paso 2: Crear un shell de aplicación

Cree un shell de aplicación automáticamente con la CLI.

<code-example language = "bash">
ng generar app-shell
</code-example>

* `client-project` toma el nombre de la aplicación cliente.

Después de ejecutar este comando, notará que el archivo de configuración `angular.json` se ha actualizado con algunos otros cambios y dos nuevos objetivos.

<code-example language = "json">
"server": {
  "builder": "@angular-devkit/build-angular:server",
  "options": {
    "outputPath": "dist/my-app-server",
    "main": "src/main.server.ts",
    "tsConfig": "tsconfig.server.json"
  }
},
"app-shell": {
  "builder": "@angular-devkit/build-angular:app-shell",
  "options": {
    "browserTarget": "my-app:build",
    "serverTarget": "my-app:server",
    "route": "shell"
  },
  "configurations": {
    "production": {
      "browserTarget": "my-app:build:production",
      "serverTarget": "my-app:server:production"
    }
  }
}
</code-example>

## Paso 3: asegúrese de que su aplicación esté construida con contenido de el shell

Construya el objetivo `app-shell` usando la CLI.

<code-example language = "bash">
ng ejecutar my-app: app-shell
</code-example>

Alternativamente, puede usar la configuración de producción.

<code-example language = "bash">
ng ejecutar my-app: app-shell: production
</code-example>

Para ver el resultado de la compilación, abra `dist / my-app / index.html`. Busque el texto predeterminado `app-shell works!` Para indicar que la ruta del shell de la aplicación se representó como parte de la salida.