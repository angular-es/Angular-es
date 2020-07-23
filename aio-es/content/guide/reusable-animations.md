# 再利用可能なanimación

#### 前提

次の概念への基本的な理解:

* [Angularanimación・Introducción](guide/animations)
* [animaciónの遷移とトリガー](guide/transition-and-triggers)

<hr>

Angularanimaciónの[AnimationOptions](api/animations/AnimationOptions)インターフェースを使用すると、異なるコンポーネント間で再利用できるanimaciónを作成できます。

## 再利用可能なanimaciónの作成

再利用可能なanimaciónを作成するには、[`animation()`](api/animations/animation)メソッドを使用してanimaciónを別の`.ts`ファイルに定義し、このanimación定義を`const`のexport変数として宣言します。 このanimaciónは、[`useAnimation()`](api/animations/useAnimation)APIを使用して任意のコンポーネントでimportすると再利用できます。

<code-example path="animations/src/app/animations.ts" header="src/app/animations.ts" region="reusable" language="typescript"></code-example>

上記のコードスニペットでは、`transAnimation`がexport変数として宣言されているので再利用可能です。

<div class="alert is-helpful">

**Note:** `height`、`opacity`、`backgroundColor`、および`time`の値は、実行時に置き換えられます。
</div>

`transAnimation`変数をコンポーネントクラスにインポートすると、次に示された`useAnimation()`を用いる方法で再利用することができます。

<code-example path="animations/src/app/open-close.component.3.ts" header="src/app/open-close.component.ts" region="reusable" language="typescript"></code-example>

## Angularanimaciónの詳細

あなたは次に興味があるかもしれません:

* [Angularanimación・Introducción](guide/animations)
* [animaciónの遷移とトリガー](guide/transition-and-triggers)
* [複雑なanimaciónシーケンス](guide/complex-animation-sequences)
* [ルーティング遷移のanimación](guide/route-animations)
