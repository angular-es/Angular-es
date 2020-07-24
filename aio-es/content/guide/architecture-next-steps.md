# Próximos pasos: ツールとTécnica

基本的なAngularの構成ブロックを理解したあと、
Angularアプリケーションの開発と提供に役立つ機能とツールの詳細を学ぶことができます。

* [ツアー・オブ・ヒーローズ](tutorial)Tutorialを通じて、基本的な要素を組み合わせてうまく設計されたアプリケーションを作る方法を実感することができます。

* [Glosario](guide/glossary) では Angular 特有の単語や使い方を知ることができます。

* 開発の段階や関心のある分野に応じて、キーとなる機能を深く学ぶためにドキュメントを活用してください。

## アプリケーションの設計

* [コンポーネント & Plantillas](guide/displaying-data)ガイドでは、アプリケーションのデータをコンポーネントの[Plantillas](guide/glossary#template)につなぎ、インタラクティブなアプリケーションを作る方法を解説します。

* [NgModules](guide/ngmodules) ガイドでは、Angular アプリケーションのモジュール構造について詳しい情報を提供します。

* [Enrutamiento y transición de pantalla](guide/router) ガイドでは、異なる[ビュー](guide/glossary#view)の間を遷移するようなシングルページアプリケーションの作り方について詳しく説明します。

* [Inyección de dependencia](guide/dependency-injection) ガイドでは、それぞれのコンポーネントクラスが機能を提供するためのサービスやオブジェクトを取得できるようなアプリケーションの作り方について詳しく説明します。

## レスポンシブプログラミング

**コンポーネント & Plantillas** ガイドでは、ビューでコンポーネントのデータを表示したいときや、ユーザーの入力に応じたいときに使う[Plantillas構文](guide/template-syntax)のガイダンスと詳細を提供します。

さらにこれらのページやセクションには、Angular アプリでのいくつかの基本的なTécnicaが記載されています。

* [ライフサイクル・フック](guide/lifecycle-hooks): ライフサイクル・フックインターフェースを実装することで、コンポーネントの作成から破棄まで、コンポーネントの存続期間中の重要な瞬間に触れることができます。

* [Observable とイベント処理](guide/observables): コンポーネントやサービスで observable を使用して、ユーザーインタラクションイベントや非同期操作結果など、あらゆるタイプのメッセージをパブリッシュして購読する方法です。

* [Angular elements](guide/elements): フレームワークに依存しない形で新たな HTML 要素を定義するウェブ標準技術である Web Components を使って、コンポーネントを *custom elements* としてパッケージする方法です。

* [フォーム](guide/forms): HTML ベースの検証とダーティーチェックを使用して、複雑なデータ入力シナリオをサポートします。

* [animación](guide/animations): Angularのanimaciónライブラリを使用して、animaciónTécnicaやCSSの詳細な知識なしに
コンポーネントの動作をアニメートできます。

## クライアントとサーバーのインタラクション

Angular は、ほとんどのロジックやデータがクライアント側にあるシングルページアプリケーション向けのフレームワークを提供します。
ほとんどのアプリはデータを取得、保存するために `HttpClient` を使ってサーバーにアクセスする必要があります。
いくつかのプラットフォームやアプリケーションでは、PWA (Progressive Web App) モデルによってユーザー体験を改善させたいかもしれません。

* [HTTP](guide/http): HTTP クライアントを使用してサーバーと通信してデータを取得、保存し、サーバー側のアクションを呼び出します。

* [サーバーサイドレンダリング](guide/universal): Angular Universal は、サーバーサイドレンダリング(SSR)によってサーバー上に静的アプリケーションページを生成します。これにより、パフォーマンスを向上させ、モバイルデバイスや低パワーのデバイスで最初のページをすばやく表示し、Webクローラを手助けするために、Angular アプリケーションをサーバー上で実行できます。

* [Service WorkersとPWA](guide/service-worker-intro): service worker を使用してネットワークへの依存を減らしユーザー体験を大幅に改善します。

* [Web workers](guide/web-worker): CPU を使う処理をバックグラウンドスレッドで走らせる方法について学びます。

## 開発サイクルのサポート

**開発ワークフロー** セクションでは、Angular アプリケーションのコンパイル、テスト、Desplegarに使うツールやプロセスについて説明します。

* [CLIコマンドリファレンス](cli): Angular CLIは、プロジェクトの作成、アプリケーションおよびライブラリコードの生成、およびテスト、バンドル、Desplegarなどのさまざまな進行中の開発タスクの実行に使用するコマンドラインツールです。

* [コンパイル](guide/aot-compiler): Angularは、開発環境用のジャストインタイム（JIT）コンパイルと、本番環境用の事前（AOT）コンパイルを提供します。

* [テスティングプラットフォーム](guide/testing): Angular フレームワークとやり取りするアプリケーションの部品において、ユニットテストを実行します。

* [Desplegarメント](guide/deployment): Angular アプリケーションをリモートサーバーにDesplegarする方法を学びます。

* [Seguridadガイドライン](guide/security): 一般的な Web アプリケーションの脆弱性やクロスサイトスクリプティングなどの攻撃に対する Angular の組み込みの保護機能について説明します。

* [国際化](guide/i18n):  Angular の国際化(i18n)ツールを使用して、アプリを複数の言語で利用できるようにします。

* [アクセシビリティ](guide/accessibility): アプリをすべてのユーザーにとって使いやすくしましょう。


## ファイル構造、設定、依存

* [ワークスペースとファイル構成](guide/file-structure): Angularワークスペースとプロジェクトフォルダの構造を理解する。

* [ビルドとサーブ](guide/build): 開発時、ステージング、およびプロダクションなど、プロジェクトのさまざまなビルドおよびプロキシサーバー構成を定義する方法を学びます。

* [npmパッケージ](guide/npm-packages): Angular フレームワーク、Angular CLI、Angularアプリケーションで使用されるコンポーネントは、[npm](https://docs.npmjs.com/)パッケージとしてパッケージ化され、npmレジストリを介して配布されます。 Angular CLIはデフォルトの `package.json`ファイルを作成します。このファイルは、うまく機能し、多くの一般的なアプリケーションシナリオを共同でサポートするパッケージのスターターセットを指定します。

* [TypeScript の設定](guide/typescript-configuration): TypeScript は Angular アプリケーション開発における主要な言語です。

* [ブラウザのサポート](guide/browser-support): アプリを幅広いブラウザに対応させます。

## Angular の拡張

* [Angular ライブラリ](guide/libraries): 再利用可能なライブラリの使い方、作り方を学びます。

* [Schematics](guide/schematics): CLI の自動生成機能をカスタマイズしたり拡張したりする方法を学びます。

* [CLI builders](guide/cli-builder): アプリケーションのビルドやテストなどの複雑なタスクを実行するように CLI の機能をカスタマイズ、拡張する方法を学びます。