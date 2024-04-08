# Factorio Mod Development Deployment

## 概要
この`Makefile`は、FactorioのMod開発者が自分の開発環境にModをデプロイするためのプロセスを自動化するために使用されます。`make`コマンドを実行することで、Modの圧縮と開発環境への配置が行われます。

## 前提条件
- `zip`または`7z`コマンドがインストールされている必要があります。
- `jq`コマンドがインストールされており、Modのバージョン情報をJSONファイルから抽出できること。

## 設定
1. 環境変数`FACTORIO_MODS_DIR`に、Factorioのmodsディレクトリへのパスを設定します。この環境変数は、Modがデプロイされる場所を指定するために使用されます。
   ```
   export FACTORIO_MODS_DIR=<your_mods_directory_path>
   ```
   `<your_mods_directory_path>`をFactorioのModが存在するディレクトリのパスに置き換えてください。

## 使用方法

この`Makefile`は、あなたが作成したModのディレクトリと同じ階層に配置して使用してください。例えば、`my-awesome-mod`というディレクトリでModを開発している場合、`Makefile`は`my-awesome-mod`ディレクトリの隣に置かれるべきです。

```
FactorioMods/
│
├── my-awesome-mod/
│   └── ...（Modのファイルとディレクトリ）
└── Makefile
```

これにより、`Makefile`からの相対パスが正しく設定され、`make`コマンドの実行時にModのディレクトリが適切に認識されます。`Makefile`の`deploy`ターゲットを使用すると、Modが自動的に圧縮され、設定した`FACTORIO_MODS_DIR`に適切に配置されます。

```bash
make deploy MODNAME=<modname>
```

zipコマンドではなく7zzコマンドで圧縮する場合は以下のようにします。

```bash
make deploy ZIPCMD=7zz MODNAME=<modname>
```


## 注意事項
- 正しいバージョン情報を使用するには、Modのディレクトリ内に`info.json`ファイルが存在し、適切なバージョン番号が記載されている必要があります。
- `FACTORIO_MODS_DIR`が設定されていない場合、`make`コマンドはエラーを出力します。指示に従って環境変数を設定してから再度試してください。

この`Makefile`を使用することで、Factorio Modの開発とテストをスムーズに進めることができます。

## ライセンス

このプロジェクトはMITライセンスのもとで公開されています。詳細については、LICENSEファイルをご覧ください。

## フィードバック

ご意見やご質問、機能のリクエストがありましたら、お気軽にコメントを残してください。改善に向けて皆様のフィードバックを歓迎します。
