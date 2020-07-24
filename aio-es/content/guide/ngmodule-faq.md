# NgModuleのFAQ

NgModuleは機能の密なブロックにアプリケーションを整理するのに役立ちます。

このページでは NgModule のデザインや実装についての多くの開発者の質問に回答します。


## どのクラスを`declarations`配列に追加すべきですか?

[宣言](guide/bootstrapping#the-declarations-array)クラス(コンポーネント、ディレクティブ、またはパイプ)を`declarations`配列に追加してください。

これらのクラスはアプリケーション内で_ただ1つ_のモジュールだけで宣言してください。
特定のモジュールに属している場合にはそのモジュール内で宣言してください。

<hr/>

{@a q-declarable}

## _宣言_とは何ですか?

宣言とはモジュールの`declarations`配列に追加できるクラス型
(コンポーネント、ディレクティブ、パイプ)です。
宣言だけが、`declarations`に追加できるクラスです。

<hr/>

## どのクラスを`declarations`配列に追加すべきでは_ない_ですか?

[宣言](guide/bootstrapping#the-declarations-array)クラスだけを1つのNgModuleの`declarations`配列に追加してください。

次のような場合は宣言*しない*でください:

* アプリケーションモジュール、@NgModule、もしくはサードパーティのモジュールであろうとなかろうと、他のモジュールで宣言されているクラス。
* 他のモジュールからインポートされているディレクティブの配列。
  たとえば、`@angular/forms`の`FORMS_DIRECTIVES`を宣言してはいけません。`FormsModule`ですでに宣言しています。

* モジュールクラス。
* サービスクラス。
* Angularと無関係なクラスやオブジェクト。
たとえば文字列、数値、関数、エンティティーモデル、設定、ビジネスロジック、ヘルパークラスなどです。

<hr/>


## 複数の`NgModule`プロパティに同じコンポーネントが存在するのはなぜですか?

`AppComponent`はよく`declarations`、`bootstrap`配列の両方に追加されています。
あなたは同じコンポーネントが`declarations`、`exports`や`entryComponents`に追加されているのを見かけるかもしれません。

冗長にみえるかもしれませんが、個々のプロパティは別の機能を持っています。
1つのリスト内のメンバーであるということは、他のリストのメンバーであることを意味するものではありません。

* `AppComponent`は、このモジュールで宣言されていても、ブートストラップはされていないかもしれません。
* `AppComponent`は、このモジュールでブートストラップされていても、別のフィーチャーモジュールで宣言されているかもしれません。
* コンポーネントは、他のアプリケーションモジュールからインポートしつつ(だからあなたは宣言できません)、このモジュールによって再エクスポートされているかもしれません。
* コンポーネントは、外部コンポーネントのPlantillasに含めるためにエクスポートされ、
同様にポップアップダイアログで動的にロードされるかもしれません。

<hr/>

## "Can't bind to 'x' since it isn't a known property of 'y'" とはどういう意味ですか?

このエラーの多くはディレクティブ"x"が宣言されていない、
または"x"が属しているNgModuleがインポートされていないことを意味します。

<div class="alert is-helpful">

アプリケーション内のサブモジュールで"x"を宣言してはいますが、それをエクスポートし忘れている可能性があります。
"x"クラスは`exports`配列に追加しない限り、他のモジュールからは参照できません。

</div>

<hr/>

## 何をインポートすべきですか?

モジュールのコンポーネントのPlantillasから参照する必要があるときに公開(エクスポート)された[宣言クラス](guide/bootstrapping#the-declarations-array)
をもつNgModuleをインポートしてください。

これは`NgIf`や`NgFor`などのAngularディレクティブにアクセスしたいときは常に
`@angular/common`から`CommonModule`をインポートすることを意味します。
直接、またはそれを[再エクスポート](guide/ngmodule-faq#q-reexport)している他のNgModuleからインポートできます。

コンポーネントで`[(ngModel)]`双方向バインディング式を使用している場合は
`@angular/forms`から`FormsModule`をインポートしてください。

このモジュールのコンポーネントが_共有モジュール_、
_フィーチャーモジュール_のコンポーネント、ディレクティブやパイプを組み込むときにそれをインポートしてください。

[BrowserModule](guide/ngmodule-faq#q-browser-vs-common-module)はRaíz`AppModule`でのみインポートしてください。

<hr/>

{@a q-browser-vs-common-module}

## `BrowserModule`と`CommonModule`のどちらをインポートすべきですか?

ほぼすべてのブラウザアプリケーションでは、
ルートアプリケーションモジュールである`AppModule`で`@angular/platform-browser`から`BrowserModule`をインポートすべきです。

`BrowserModule`はブラウザアプリケーションの起動と実行に不可欠なサービスを提供します。

`BrowserModule`は`@angular/common`から`CommonModule`を再エクスポートもしています。
これは`AppModule`内のコンポーネントが`NgIf`や`NgFor`のような、
すべてのアプリケーションで必要なAngularディレクティブにアクセスできることを意味します。

`BrowserModule`を他のモジュールからインポートしてはいけません。
*フィーチャーモジュール*と*遅延ロードするモジュール*では、かわりに`CommonModule`をインポートすべきです。
これらは共通のディレクティブが必要で、アプリケーション全体のプロバイダーを再インストールする必要はありません。

また、`CommonModule`をインポートすることで、フィーチャーモジュールをブラウザだけでなく _あらゆる_ 対象のプラットフォームでも使えるようにします。

<hr/>

{@a q-reimport}

## 同じモジュールを2回インポートするとどうなりますか?

問題ありません。3つのモジュールがすべてモジュール'A'をインポートすると、
Angularは最初の一度だけモジュール'A'を評価して、再度評価することはありません。

これはインポートされたNgModule内のどのレベルで`A`が現れても真です。
モジュール'B'がモジュール'A'をインポートし、モジュール'C'がモジュール'B'をインポートし、そしてモジュール'D'が`[C, B, A]`をインポートしたとき、
'D'は'C'の評価をトリガーします。'C'は'B'の評価をトリガーし、'B'は'A'を評価します。
Angularが'D'内の'B'と'A'を取得したとき、それらはすでにキャッシュされていて準備は完了しています。

Angularは循環参照しているNgModuleを受け付けません。モジュール'A'がモジュール'B'をインポートして、モジュール'B'がモジュール'A'をインポートするようにしないようにしてください。

<hr/>

{@a q-reexport}

## 何をエクスポートすべきですか?

[宣言](guide/bootstrapping#the-declarations-array)クラスをエクスポートしてください。
それを、_他_のNgModule内のコンポーネントがPlantillasにて参照できます。これが_公開_クラスです。
宣言クラスをエクポートしない場合、それは_非公開_のままとなり、
同一NgModule内の他のコンポーネントでのみ参照できます。

このNgModule内、
もしくはインポートしたNgModule内で宣言されている任意の宣言クラス(コンポーネント、ディレクティブ、またはパイプ)をエクスポート_できます_。

インポートしたNgModule全体を再エクスポートすることが_できます_。それらがエクスポートしているクラス全体を効果的に再エクスポートします。
NgModuleはインポートしていないモジュールをエクスポートすることもできます。

<hr/>

## 何をエクスポートすべきでは*ない*ですか?

次のようなものはエクスポートしてはいけません:

* 対象のNgModuleで宣言したコンポーネント内でのみ必要な、非公開のコンポーネント、ディレクティブ、およびパイプ。
他のNgModuleに見せたくなければ、エクスポートしてはいけません。
* 宣言ではないオブジェクト、たとえば、サービス、関数、設定やエンティティーモデルなどです。
* ルーターから動的にロードされる、またはブートストラップにだけ使用されるコンポーネント。
そのような[エントリーコンポーネント](guide/ngmodule-faq#q-entry-component-defined)は他のコンポーネントのPlantillasから選択されることは決してありません。
エクスポートすることに害はありませんが、利益もありません。
* 公開(エクスポート)している宣言をもたない純粋なサービスモジュール。
たとえば、`HttpClientModule`は何もエクスポートしているものがないので再エクスポートする意味はありません。
その唯一の目的はHTTPサービスプロバイダーをアプリケーション全体に追加することです。



<hr/>

## クラスやモジュールを再エクスポートできますか?

もちろんできます。

NgModuleは他のNgModuleから選択的にクラスを集約したり、
それらを統合した便利なモジュールに再エクスポートする素晴らしい方法の1つです。

NgModuleはNgModule全体を再エクスポートできます。エクスポートされたクラス全体を効果的に再エクスポートします。
Angular自身の`BrowserModule`は次のような2つのNgModuleをエクスポートします:

```typescript
exports: [CommonModule, ApplicationModule];
```

NgModuleは自身がもつ宣言、選択したインポートしたクラス、インポートしたNgModuleを組み合わせてエクスポートできます。

純粋なサービスモジュールの再エクスポートで悩まないでください。
純粋なサービスモジュールは他のNgModuleで使用できる[宣言](guide/bootstrapping#the-declarations-array)クラスをエクスポートしません。
たとえば、`HttpClientModule`は何もエクスポートしないので、再エクスポートする必要はありません。
その唯一の目的は、HTTPサービスプロバイダーをアプリケーション全体に追加することです。


<hr/>


## `forRoot()`メソッドとは何ですか?

`forRoot()`静的メソッドは、開発者がシングルトンであることを意図したサービスとプロバイダーを簡単に設定できるようにするための規約です。`forRoot()`の良い例は、`RouterModule.forRoot()`メソッドです。

アプリケーションはアプリケーション全体の`Router`サービスを設定するために`RouterModule.forRoot()`に`Routes`オブジェクトを渡します。
`RouterModule.forRoot()`は[ModuleWithProviders](api/core/ModuleWithProviders)を返します。
Raíz`AppModule`の`imports`配列にその結果を追加します。

`forRoot()`の結果はルートアプリケーションモジュールである`AppModule`でだけ実行してインポートしてください。
他のモジュール、特に遅延ロードされるモジュールでインポートしないでください。
詳細については[Servicio Singleton](guide/singleton-services) の [`forRoot()` パターン](guide/singleton-services#the-forroot-pattern) セクションを参照してください。

サービスについては、`forRoot()`を使用するかわりにサービスの`@Injectable()`デコレーターに`providedIn: 'root'`を指定してください。
これはサービスを自動的にアプリケーション全体で有効にし、この結果としてデフォルトでシングルトンになります。

`RouterModule`は遅延ロードするモジュールのルーティングを設定するために `forChild()` 静的メソッドも提供しています。

`forRoot()`と`forChild()`は、それぞれルートモジュールとフィーチャーモジュールで
サービスの設定を行うメソッドのための慣例的な名前です。

サービスプロバイダーを設定可能な類似のモジュールを書くときは、この規約にしたがってください。


<hr/>


## フィーチャーモジュールで提供されるサービスがどこでも見えるのはなぜですか?

ブートストラップされるモジュールの`@NgModule.providers`に並んだプロバイダーは、アプリケーションのスコープをもちます。
`@NgModule.providers`にサービスプロバイダー追加することはアプリケーション全体に効果的にサービスを公開します。

1つのNgModuleをインポートしたとき、
Angularはモジュールのサービスプロバイダー(`providers`配列の内容)を
アプリケーションのルートインジェクターに追加します。

これにより、プロバイダーのルックアップトークンや、名前を知っているアプリケーション内のすべてのクラスでプロバイダーが参照できるようになります。

NgModuleのインポートによる拡張性はNgModuleシステムの第一の目標です。
アプリケーションインジェクターにNgModuleのプロバイダーをマージすることで、
新しいサービスでアプリケーション全体を豊かにすることが、モジュールライブラリにとって簡単になります。
`HttpClientModule`を1回追加することにより、すべてのアプリケーションのコンポーネントはHTTPリクエストできるようになります。

しかしながらこれは、フィーチャーモジュールで宣言したコンポーネントだけにモジュールのサービスを見せたい場合は、
歓迎されないサプライズとなるでしょう。
もし`HeroModule`が`HeroService`を提供していて、Raíz`AppModule`が`HeroModule`をインポートする場合、
`HeroModule`内で宣言したクラスだけでなく、
`HeroService`の_型_を知っている任意のクラスでそのサービスを注入できます。

サービスへのアクセスを制限するには、そのサービスを提供するNgModuleを遅延ロードすることを検討してください。詳細は[どのようにサービスのスコープをモジュールに制限しますか?](guide/ngmodule-faq#service-scope)を参照してください。

<hr/>

{@a q-lazy-loaded-module-provider-visibility}

## なぜ遅延ロードしたモジュールで提供されるサービスはそのモジュールだけで参照できるのですか?

起動時にロードするモジュールのプロバイダーとは異なり、
遅延ロードするモジュールのプロバイダーは*モジュールにスコープされます*。

Angularルーターがモジュールを遅延ロードするとき、新しい実行コンテキストを作成します。
その[コンテキストは自身のインジェクターを持ちます](guide/ngmodule-faq#q-why-child-injector "Why Angular creates a child injector")。
これはアプリケーションインジェクターの直接の子供になります。

ルーターは遅延ロードしたモジュールのプロバイダーとそれがインポートしているNgModuleのプロバイダーをこの子インジェクターに追加します。

これらのプロバイダーは同じルックアップトークンをもつアプリケーションプロバイダーの変更から隔離されます。
ルーターが遅延ロードしたコンテキスト内でコンポーネントを作成するとき、
Angularはアプリケーションのルートインジェクターのサービスインスタンスよりもこれらのプロバイダーが作成したサービスインスタンスを優先します。

<hr/>


## 2つのモジュールが同じサービスを提供するとどうなりますか?

2つのモジュールをインポートして、同時にロードし、同じトークンでプロバイダーを追加したとき、
2つ目のモジュールのプロバイダーが"勝ち"ます。両方のプロバイダーが同じインジェクターに追加されるからです。

Angularがそのトークンのサービスを注入するとき、
2つ目のプロバイダーから作成されたインスタンスを配信します。

このサービスを注入する_すべて_のクラスは2つ目のプロバイダーによって作成されたインスタンスを取得します。
1つ目のモジュールで宣言されたクラスであっても、2つ目のプロバイダーによって作成されたインスタンスを取得します。

NgModule Aがトークン'X'のサービスを提供していて、こちらもトークン'X'のサービスを提供するNgModule Bをインポートしている場合、
NgModule Aのサービス定義が"勝ち"ます。

Raíz`AppModule`が提供するサービスはインポートしたNgModuleが提供するサービスよりも優先されます。
`AppModule`が常に勝ちます。

<hr/>

{@a service-scope}

## どのようにサービスのスコープをモジュールに制限しますか?

モジュールがアプリケーションの起動時にロードされたとき、
その`@NgModule.providers`は*アプリケーション全体のスコープ*を持ちます。
つまり、アプリケーション全体に注入できます。

インポートしたプロバイダーは、他のインポートしたNgModuleからのプロバイダーによって簡単に置き換えられます。
そのような置き換えは意図的なものかもしれません。意図的でなく、悪影響を及ぼすかもしれません。

原則として、プロバイダーをもつモジュールは、できれば、アプリケーションの_ルートモジュール_内で_1回だけ_インポートしてください。
ルートモジュールは通常、プロバイダーを設定、ラップ、オーバーライドするのに最適な場所です。

あるモジュールが、すべてのHTTPリクエストに特別なヘッダーを追加する、カスタマイズされた`HttpBackend`を必要とすると仮定します。
アプリケーションの他のところで別のモジュールが、同じく`HttpBackend`をカスタマイズしたり、単純に`HttpClientModule`をインポートしたりする場合、
それがこのモジュールの`HttpBackend`プロバイダーをオーバーライドして、
特別なヘッダーが失われる可能性があります。サーバーはこのモジュールからのHTTPリクエストを拒否するでしょう。

この問題を回避するためには、アプリケーションの_ルートモジュール_である`AppModule`でのみ`HttpClientModule`をインポートしてください。

このような"プロバイダーの破損"を防ぐ必要がある場合は、*起動時のモジュールの`providers`に依存してはいけません*。

できるならモジュールを遅延ロードしてください。
Angularは[遅延ロードするモジュール](guide/ngmodule-faq#q-lazy-loaded-module-provider-visibility)に自身の子インジェクターを与えます。
モジュールのプロバイダーはこのインジェクターで作成されたコンポーネントツリー内だけで参照できます。

もしもアプリケーションを開始するときに、モジュールを事前読み込みしなければならない場合は、
*代わりにコンポーネント内でサービスを提供してください*。

同じ例で続けます。モジュールのコンポーネントが本当にプライベートなカスタム`HttpBackend`を必要とすると仮定してください。

そのモジュールのすべてのコンポーネントの、ルートとして機能する"トップコンポーネント"を作成します。
カスタム`HttpBackend`プロバイダーをモジュールの`providers`ではなくトップコンポーネントの`providers`配列に追加してください。
Angularはコンポーネントインスタンスごとに子インジェクターを作成し、
そのインジェクターにコンポーネント自身のプロバイダーを追加する、ということを覚えていてください。

コンポーネントの子供が`HttpBackend`サービスを呼び出すとき、
Angularはアプリケーションのルートインジェクターに提供されたものではなく、
ローカルの`HttpBackend`サービスを提供します。
他のモジュールが`HttpBackend`に何をしても、子コンポーネントは適切なHTTPリクエストを行います。

このモジュールのトップコンポーネントの子としてモジュールコンポーネントを作成してください。

子コンポーネントをトップコンポーネントのPlantillasに埋め込むことができます。
別の方法として、そこに`<router-outlet>`を指定することで、トップコンポーネントをルーティングホストにできます。
子ルーティングを定義して、ルーターにモジュールのコンポーネントをそのアウトレットにロードさせます。

遅延ロードしたモジュールか、コンポーネント内でサービスを提供することでアクセスを制限できますが、コンポーネント内でサービスを提供することでそれらのサービスのインスタンスが複数作成される可能性があります。したがって、遅延ロードのほうがより好ましい方法です。

<hr/>

{@a q-root-component-or-module}


## Raíz`AppModule`とRaíz`AppComponent`のどちらにアプリケーション全体のプロバイダーを追加すべきですか?

アプリケーション全体のプロバイダーはその`@Injectable()`デコレーター(サービスの場合は)に`providedIn: 'root'`を指定することか、`InjectionToken`構文(トークンが提供された場合)で定義してください。この方法で自動的に作成されたプロバイダーはアプリケーション全体で有効になり、どのモジュール内にも追加する必要はありません。

プロバイダーをこの方法で設定できない場合は(おそらくは妥当なデフォルト値をもたない)、アプリケーション全体のプロバイダーをRaíz`AppModule`内に登録してください。`AppComponent`内ではありません。

遅延ロードするモジュールとそのコンポーネントは`AppModule`のサービスを注入できます。
`AppComponent`のサービスを注入することはできません。

サービスを`AppComponent`ツリーの外側のコンポーネントから隠す必要がある場合に_のみ_、`AppComponent`のプロバイダーにサービスを登録してください。
これはレアなユースケースです。

より一般的に、コンポーネントよりも[NgModule内にプロバイダーを登録することをおすすめします](guide/ngmodule-faq#q-component-or-module)。

<h3 class="no-toc">ディスカッション</h3>

Angularはアプリケーションのルートインジェクターにすべてのスタートアップのモジュールプロバイダーを登録します。
ルートインジェクターのプロバイダーが作成するサービスは、アプリケーションのスコープをもちます。
これは、アプリケーション全体でそれらが有効であることを意味します。

`Router`などの特定のサービスはそれらをアプリケーションのルートインジェクターに登録するときにのみ機能します。

一方、Angularは`AppComponent`自身のインジェクターに`AppComponent`のプロバイダーを登録します。
`AppComponent`のサービスはそのコンポーネントとコンポーネントツリーでのみ有効になります。
それらはコンポーネントスコープをもちます。

`AppComponent`のインジェクターはインジェクターの階層が一段下であるルートインジェクターの子供です。
ルーターを使用しないアプリケーションの場合は、ほとんどすべてのアプリケーションに該当します。
しかし、ルーティングされたアプリケーションではルーティングは
`AppComponent`サービスが存在しない場所のルートレベルで動作します。
これは遅延ロードするモジュールがそれらにリーチできないことを意味します。

<hr/>

{@a q-component-or-module}

## 他のプロバイダーをモジュールやコンポーネントに追加すべきですか?

プロバイダーは`@Injectable`構文を使用して設定すべきです。もし可能ならば、アプリケーションルート(`providedIn: 'root'`)に提供すべきです。この方法で設定されたサービスは遅延ロードされたコンテキストでのみ使用される場合に遅延ロードされます。

プロバイダーがアプリケーション全体で利用可能かどうかをプロバイダーの利用者が判断する場合、
コンポーネント内(`@Component.providers`)に登録するかわりにモジュール内(`@NgModule.providers`)にプロバイダーを登録してください。

対象のコンポーネントとそのコンポーネントツリーにサービスのインスタンスのスコープを制限する*必要がある*とき、
コンポーネントにプロバイダーを登録してください。
ディレクティブにプロバイダーを登録するときも同じ理由を適用してください。

たとえば、
キャッシュしたサービスのプライベートコピーが必要なエディタのようなコンポーネントはコンポーネントにサービスを登録すべきです。
個々のコンポーネントの新しいインスタンスは各自キャッシュされたサービスのインスタンスを取得します。
エディタがそのサービスで行う変更は、アプリケーション内の他のインスタンスには影響を及ぼしません。

[常にRaíz`AppModule`に_アプリケーション全体_のサービスを登録してください](guide/ngmodule-faq#q-root-component-or-module)、
Raíz`AppComponent`ではありません。

<hr/>

{@a q-why-bad}


## なぜ共有モジュールが遅延ロードするモジュールにサービスを提供することが悪いことなのですか?

### 事前ロードでのシナリオ
事前ロードするモジュールがサービスを提供するとき、たとえば`UserService`というサービスがあったとします、そのサービスはアプリケーション全体で有効になります。
ルートモジュールが`UserService`を提供していて、同じ`UserService`を提供する別のモジュールをインポートしている場合、
Angularはそれらのうち1つをルートアプリケーションインジェクターに登録します([同じモジュールを2回インポートするとどうなりますか?](guide/ngmodule-faq#q-reimport)を参照してください)。

そのあと、コンポーネントが`UserService`を注入したとき、Angularはルートアプリケーションインジェクター内からそれをみつけて、
アプリケーション全体でシングルトンなサービスを渡します。問題ありません。

### 遅延ロードでのシナリオ

次に、同じく`UserService`と呼ばれるサービスを提供する遅延ロードモジュールを考えてみましょう。

ルーターがモジュールを遅延ロードするとき、それは子インジェクターを作成して、その子インジェクターに`UserService`プロバイダーを登録します。
子インジェクターはルートインジェクターでは_ありません_。

Angularがそのモジュールの遅延コンポーネントを作成して`UserService`を注入するとき、
それは遅延モジュールの_子インジェクター_内の`UserService`プロバイダーをみつけて、
`UserService`の_新しい_インスタンスを生成します。
これは、Angularが事前ロードしたコンポーネントで注入した、
アプリケーション全体でシングルトンなバージョンとは完全に違う、`UserService`のインスタンスになります。

このシナリオでは、シングルトンを使用する代わりに、毎回新しいインスタンスが作成されます。
<!--KW--What does this cause? I wasn't able to get the suggestion of this to work from
the current FAQ:
To demonstrate, run the <live-example name="ngmodule">live example</live-example>.
Modify the `SharedModule` so that it provides the `UserService` rather than the `CoreModule`.
Then toggle between the "Contact" and "Heroes" links a few times.
The username goes bonkers as the Angular creates a new `UserService` instance each time.
I'd like to see the error so I can include it.-->

<hr/>

{@a q-why-child-injector}

## なぜ遅延ロードは子インジェクターを作成するのですか?

NgModuleが遅延ロードされていない場合、Angularは`@NgModule.providers`をアプリケーションのルートインジェクターに追加します。
遅延ロードするNgModuleでは、Angularは_子インジェクター_を作成して、モジュールのプロバイダーを子インジェクターに追加します。

NgModuleが起動時にロードされるのか、遅延ロードされるのかによって動作が異なることを意味します。
その違いを軽視すると、[悪影響](guide/ngmodule-faq#q-why-bad)につながる恐れがあります。

なぜAngularは事前ロードしたNgModule同様に、遅延ロードしたプロバイダーをアプリケーションのルートインジェクターに追加しないのでしょうか?

その答えは、AngularのInyección de dependenciaシステムの基本的な特性にもとづいています。
インジェクターは_それがはじめて使用されるまで_プロバイダーを追加できます。
インジェクターが一度サービスを作成して配送しはじめたら、そのプロバイダーのリストは固定されます。新しいプロバイダーは許容されません。

アプリケーションが開始するとき、Angularは最初のコンポーネントの作成も提供されるいずれのサービスの注入もする_前に_、
まずはルートインジェクターにすべての事前ロードしたNgModuleのプロバイダーを設定します。
一度アプリケーションが起動したらアプリケーションのルートインジェクターは新しいプロバイダーを受け付けません。

時間が経過して、アプリケーションのロジックがNgModuleの遅延ロードをトリガーします。
Angularは、遅延ロードしたモジュールのプロバイダーをどこかのインジェクターに追加する必要があります。
アプリケーションルートインジェクターは新しいプロバイダーを受け付けないためそこに追加することはできません。
したがって、Angularは遅延ロードしたモジュールのコンテキストのための新しい子インジェクターを作成します。

<hr/>

{@a q-is-it-loaded}

## NgModule、またはサービスが以前にロードされたかどうかをどのように確認できますか?

いくつかのNgModuleとそれらのサービスはRaíz`AppModule`から一度だけロードする必要があります。
遅延ロードするモジュールによってもう一度そのモジュールをインポートすることは、[誤ったふるまい](guide/ngmodule-faq#q-why-bad)を引き起こすことがあり、
それはみつけて診断することが難しいでしょう。

この問題を防ぐために、ルートアプリケーションインジェクターからモジュールまたはサービスを注入しようとするコンストラクターを書きましょう。
注入が成功した場合、クラスは2回目にロードされたということです。
エラーをスローしたり、他の是正措置を講じることができます。

特定の NgModule、たとえば`BrowserModule`のように、ガードを実装しましょう。
ここには`GreetingModule`と呼ばれるNgModuleのためのカスタムコンストラクターがあります。

<code-example path="ngmodules/src/app/greeting/greeting.module.ts" region="ctor" header="src/app/greeting/greeting.module.ts (Constructor)"></code-example>

<hr/>

{@a q-entry-component-defined}

## _エントリーコンポーネント_とは何ですか?

エントリーコンポーネントとは、Angularが型に基づいて_命令的に_ロードするコンポーネントのことです。

セレクター経由で*宣言的に*ロードされるコンポーネントは、エントリーコンポーネント_ではありません_。

コンポーネントのセレクターがPlantillas内の要素に置かれているときにAngularは宣言的にコンポーネントをロードします。
AngularはそのあとコンポーネントのHTML表現を作成して、選択した要素のDOMの中に挿入します。
それらはエントリーコンポーネントではありません。

ブートストラップしたRaíz`AppComponent`は_エントリーコンポーネント_です。
実際は、そのセレクターは`index.html`内の要素タグにマッチします。
しかし、`index.html`はコンポーネントPlantillasではなく、`AppComponent`
のセレクターはどのコンポーネントPlantillas内の要素にもマッチしません。

ルーティング定義内のコンポーネントも_エントリーコンポーネント_です。
ルート定義はその_型_からコンポーネントを参照します。
ルーターはルーテッドコンポーネントのセレクターを無視します(セレクターを持っていても)。
そして`RouterOutlet`内に動的にコンポーネントをロードします。

詳細については、[エントリーコンポーネント](guide/entry-components)を参照してください。

<hr/>

## _ブートストラップ_コンポーネントと_エントリーコンポーネント_の違いは何ですか?

ブートストラップするコンポーネントとはAngularがブートストラッププロセス(アプリケーションの起動)中にDOMにロードする[エントリーコンポーネント](guide/ngmodule-faq#q-entry-component-defined)
の1つです。
他のエントリーコンポーネントは別の理由で動的にロードされます。たとえばルーターからロードされます。

`@NgModule.bootstrap`プロパティはこれがエントリーコンポーネントで_かつ_
このコンポーネントと共にアプリケーションをブートストラップするためのコードを生成すべきであるとコンパイラに教えます。

コンポーネントを`bootstrap`、`entryComponents`配列両方に追加する必要はありません。
ですが、追加しても無害です。

詳細については[エントリーコンポーネント](guide/entry-components)を参照してください。

<hr/>

## どんな場合にコンポーネントを_entryComponents_に追加しますか?

ほとんどのアプリケーション開発者は`entryComponents`にコンポーネントを追加する必要はありません。

Angularは特定のコンポーネントを自動的に_エントリーコンポーネント_として追加します。
`@NgModule.bootstrap`配列に追加したコンポーネントは自動的に追加されます。
ルーター定義によって参照されるコンポーネントは自動的に追加されます。
この2つのメカニズムによってほぼすべてのエントリーコンポーネントが占められます。

もしもアプリケーションが他の方法で、ブートストラップしたりコンポーネントを_型に基づいて_動的にロードしたりする場合は、
それを明示的に`entryComponents`に追加する必要があります。

このリストにコンポーネントを追加することは無害ですが、
本当に_エントリーコンポーネント_であるものだけを追加するのがベストです。
他のコンポーネントのPlantillasで[参照される](guide/ngmodule-faq#q-template-reference)
コンポーネントは含めないでください。

詳細については[エントリーコンポーネント](guide/entry-components)を参照してください。

<hr/>


## なぜAngularは_entryComponents_が必要なのですか?

_ツリーシェイキング_のためです。プロダクションのアプリケーションでは、可能な限り最小、最速のコードをロードしたいです。コードには実際に必要なクラスのみが含まれているべきです。
そのコンポーネントが宣言されているかどうかにかかわらず、使用されていないコンポーネントは除外すべきです。

事実、多くのライブラリは使用されないであろうコンポーネントを宣言、エクスポートしています。
それらを参照してない場合、ツリーシェイカーは最終的なコードパッケージからそれらのコンポーネントを除外します。

[Angular コンパイラ](guide/ngmodule-faq#q-angular-compiler)がすべての宣言したコンポーネントのコードを生成した場合、ツリーシェイカーの目的を破ってしまうでしょう。

かわりに、コンパイラは使用するコンポーネントのみのコードを生成する再帰的な戦略を採用しています。

コンパイラはエントリーコンポーネントから開始します。
次に、宣言したコンポーネントをエントリーコンポーネントのPlantillas内から[探して](guide/ngmodule-faq#q-template-reference)コードを生成します。
次に、さきほどコンパイルしたコンポーネントのPlantillas内でみつかった宣言されているコンポーネントについて繰り返します。
プロセスの最後では、
コンパイラはすべてのエントリーコンポーネントとエントリーコンポーネントから到達できるすべてのコンポーネントの生成されたコードをもっています。

コンポーネントが_エントリーコンポーネント_でない、
もしくはPlantillas内にない場合はコンパイラはそれを切り捨てます。

<hr/>

## どのような種類のモジュールが必要ですか、どうすれば使用できますか?

すべてのアプリケーションは違います。開発者たちはさまざまなレベルの経験を持ち、利用可能な選択肢に安心します。
いくつかの提案とガイドラインには、幅広い魅力があります。

### `SharedModule`
`SharedModule`は、アプリケーション内のどこでも使用するコンポーネント、ディレクティブ、パイプをもつ`NgModule`の慣習的な名前です。
このモジュールは完全に`declarations`で構成され、
そのほとんどはエクスポートされます。

`SharedModule`は`CommonModule`、`FormsModule`、
幅広く使用するUIコントロールをもつNgModuleなどの他のウィジェットモジュールを再エクスポートできます。

`SharedModule`は、[前に説明した](guide/ngmodule-faq#q-why-bad)理由のために`providers`をもつべきではありません。
さらには、それがインポートしたか再エクスポートしたどんなモジュールも`providers`をもつべきではありません。

アプリケーションの開始時にロードするものも、あとで遅延ロードするものも、どちらでも
_フィーチャー_モジュールには`SharedModule`をインポートしてください。

### フィーチャーモジュール

フィーチャーモジュールとは、特定のアプリケーションのビジネスドメインやユーザーワークフロー、ユーティリティーコレクションに関して作成するモジュールのことです。それらは特定の機能を含むことによってアプリケーションをサポートします。
たとえば、ルーティング、サービス、ウィジェット、などなどです。
どのようなフィーチャーモジュールがあなたのアプリケーションにありえるかを概念化するために、
検索のような、ある機能に関連したファイルをひとつのフォルダーに置いてみることを考察してください。
そのフォルダーのコンテンツは`SearchModule`と呼ばれるフィーチャーモジュールとなるでしょう。
それは検索機能を作るためのすべてのコンポーネント、ルーティング、およびPlantillasを含むでしょう。

詳細については[フィーチャーモジュール](guide/feature-modules)と
[モジュールの種類](guide/module-types)を参照してください。



## NgModuleとJavaScriptのモジュールの違いは何ですか?

Angularアプリケーションでは、NgModuleとJavaScriptモジュールのどちらも一緒に働きます。

モダンなJavaScriptではすべてのファイルはモジュールです
(Exploring ES6ウェブサイトの[モジュール](http://exploringjs.com/es6/ch_modules.html)のページを参照してください)。
モジュールの一部を公開するために個々のファイルで`export`文を書きます。

AngularのNgModuleは`@NgModule`デコレーター(JavaScriptモジュールは`@NgModule`デコレーターを持ちません)のついたクラスです。
Angularの`NgModule`は`imports`、`exports`をもっていて、それらは似た目的で働きます。

エクスポートされたクラスをコンポーネントのPlantillas内で使用するため、他のNgModuleを_インポート_します。
_他の_NgModuleのコンポーネントでインポートして使用するため、このNgModuleのクラスを_エクスポート_します。

詳細については[Módulo JavaScript y NgModule](guide/ngmodule-vs-jsmodule)を参照してください。

<hr/>

{@a q-template-reference}

## AngularはどのようにしてPlantillas内からコンポーネント、ディレクティブやパイプを見つけ出すのですか?<br><i><b>Plantillas参照</b></i>とはなんですか?

[Angularコンパイラ](guide/ngmodule-faq#q-angular-compiler)はコンポーネントのPlantillas内部の他のコンポーネント、ディレクティブ、およびパイプを探します。
見つけたとき、それがPlantillas参照です。

コンポーネントやディレクティブの*セレクター*がPlantillas内のどれかのHTMLとマッチする場合に、AngularコンパイラはコンポーネントやディレクティブをPlantillas内に見つけます。

パイプの*名前*がPlantillasHTMLのパイプ構文の中に現れたら、コンパイラはパイプを見つけます。

Angularがマッチさせるセレクターとパイプ名は、このモジュールによって宣言されたクラスか、
このモジュールがインポートするモジュールによってエクスポートされたクラスだけです。

<hr/>

{@a q-angular-compiler}

## Angularコンパイラとは何ですか?

Angularコンパイラはあなたが書いたアプリケーションのコードをハイパフォーマンスなJavaScriptコードに変換します。
`@NgModule`メタデータはコンパイルプロセスで重要な役割を果たします。

あなたが書いたコードはすぐに実行可能ではありません。
たとえば、コンポーネントはネイティブなHTMLではないカスタムエレメント、属性ディレクティブ、Angularのバインディング宣言、やその他特有の構文含むPlantillasをもちます。

AngularコンパイラはPlantillasのマークアップを読んで、
それを対応するコンポーネントクラスコードと結合して_コンポーネントファクトリー_を発行します。

コンポーネントファクトリーは`@Component`メタデータ内の記述されたすべて
(HTML、バインディングインストラクション、付与したスタイル)
を組み込んだコンポーネントの100%純粋なJavaScript表現を作成します。

ディレクティブとパイプはコンポーネントのPlantillas内に現れるため、
Angularコンパイラはそれらもコンパイルしたコンポーネントコード内に組み込みます。

`@NgModule`メタデータはAngularコンパイラに対象のモジュールをコンパイルするために必要なコンポーネントと、
このモジュールを他のモジュールとリンクする方法を知らせます。