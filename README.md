Print Creator AutoPage-Plugin
===================

概要
------------

サイボウズの [kintone](https://kintone.cybozu.com/jp/) と
サイボウズスタートアップスの [プリントクリエイター](https://pc.kintoneapp.com/)
の連携をカスタマイズするためのプラグイン.

以下の3つの機能が実装されている.
1と2は通常のプリントクリエイターと同じ機能になる.

1. レコード詳細ページから1枚のPDFを出力
2. レコード一覧から検索条件にマッチするレコードを500件までPDF出力
3. レコード詳細ページから自動改ページしてPDF出力
4. ＠TODO レコード一覧から検索条件にマッチするレコードを500件まで自動改ページしてPDF出力

早く開発を開始したい人用のドキュメント
------------

### インストールから開発開始までの手順

プラグインを新たにパッケージする場合

- `git clone`
- `npm install`
- `npm run build`
- `./gulp/config.js` -> `pluginKey` を生成した key のパスに書き換える.
- `./src/config.coffee` -> `pluginId` を生成した key に書き換える.
- `npm run watch`
- ブラウザから, https://localhost:8000 にアクセス出来るようにする.
- 開発開始

既存のプラグインを修正する場合

- `git clone`
- 既存プラグインの key を `./keys` に置く
- `npm install`
- `./gulp/config.js` -> `pluginKey` を既存プラグインの key のパスに書き換える.
- `./src/config.coffee` -> `pluginId` を既存プラグインの key に書き換える.
- `npm run watch`
- ブラウザから, https://localhost:8000 にアクセス出来るようにする.
- 開発開始


インストール
------------

### Nodeのインストール

[Node.js](http://nodejs.org/)をインストールしておく必要がある.

#### Mac

``` {.bash}
  brew install node
```

brewを使っていない場合は, [これ](http://qiita.com/is0me/items/475fdbc4d770534f9ef1)
とかを参考にインストールしてください.

[nodebrew](https://github.com/hokaccha/nodebrew)を使ってバージョン管理を行いたい場合は,
[ここ](http://qiita.com/Kackey/items/b41b11bcf1c0b0d76149#mac%E7%B7%A8)とかを参考に
してください.

#### Windows

WindowsでNode.jsを利用する場合, [nodist](https://github.com/marcelklehr/nodist)が便
利です[これ](http://qiita.com/Kackey/items/b41b11bcf1c0b0d76149#windows%E7%B7%A8)
とかを参考にインストールしてください.
インストール後は, 以下のコマンドでnodeのバージョンを指定してください.

``` {.bash}
  nodist + v0.12.0
  nodist v0.12.0
```

※Windowsの場合, node-sassのインストールでエラーが起きる場合があります. node-sassを先にイ
ンストールしてからnpm installすると解決する場合があります.

### 依存ライブラリのインストール

依存ライブラリは npm を用いて管理されている.

``` {.bash}
  npm install
```

以上で依存ライブラリがインストールされる.


### 主な利用ライブラリ

主に以下のライブラリを利用している.

- [CoffeeScript](http://coffeescript.org/)
- [Gulp](http://gulpjs.com/)
- [Browserify](http://browserify.org/)


使い方
------------

### プラグイン開発

#### 新規プラグインの場合

新規開発の場合は, １度ビルドする必要がある

``` {.bash}
  npm run build
```

以下のconfigファイルを編集する必要がある.

```
    src/config.coffee
```

`./src/config.coffee` -> `pluginId` を生成した key に書き換える.

#### 既存プラグインの場合

既存プラグインの場合は, ppkファイルを `./keys` 配下に置きそのパスを指定する. 初期状態として,
開発用の key が `./gulp/config.js` -> `pluginKey` と`./src/config.coffee` ->
`pluginId` に指定されているので, 本番用に別の key を使う場合は変更が必要.

#### 開発設定

`plugin/manifest.json`は localhost をサーバーとしてリソースを読み込む設定になっている.
本番用にパッケージする時は, リソースのパスを変更する.

Debug 時には `src/config.coffee` の debug を true に設定すると良い.

#### 本番プラグインのパッケージ化

- `plugin/manifest.json` のリソースのパスを本番用に変更する.
- 本番用に別の key を使う場合
    - `./gulp/config.js` -> `pluginKey` を本番用の key のパスに書き換える.
    - `./src/config.coffee` -> `pluginId` を本番用の key に書き換える.
- `npm run build` を実行する.

### JavaScriptやSASSのビルド

Gulp タスクが幾つか用意されている.

#### ビルド

ビルドするためには

``` {.bash}
  npm run build
```

を実行する. これを実行する前に `npm install` を行って依存ライブラリが正しくインストールして
おく必要がある.

ビルド元ファイルは `src` 以下にある. ビルド後のファイルは基本的に `web` 以下に出力される.

#### Watch

開発時に, ファイルの変更を検知して, ビルド + ライブリロード +
ローカルサーバーの起動 + Pluginのパッケージ化などといったことを自動的に行ってく
れるタスクが用意されている.

監視プロセスを立ち上げるためには以下のコマンドを実行する.

``` {.bash}
  npm run watch
```

ローカルサーバーは正式な証明書をもってないので, https://localhost:8000 にアクセス出来る必
要がある. Chrome の場合は一度アクセスし, `詳細設定` ->
`https://localhost:8000にアクセスする` をクリックするとアクセスできるようになる.


ライセンス
------------

MIT