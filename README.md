ECRから別のECRにイメージをコピーするスクリプト。
普通のアプローチ。

# 必要なもの

- docker
- AWS CLI
- ソースと宛先のAWSアカウントのAPIキー

AWS CLIとDockerのインストールに関しては
[AWS CLI での Amazon ECR の使用 - Amazon ECR](https://docs.aws.amazon.com/ja_jp/AmazonECR/latest/userguide/getting-started-cli.html#getting-started-cli-prereqs)
を参照。


# 設定ファイル

## account_src.sh

ソースのアカウントを記述する。

```sh
cp account_template.sh account_src.sh
vi account_src.sh
```
のようにテンプレートからコピーして編集する。
アカウントのポリシーは、対象レポジトリが読み出せる権限があれば十分。

## account_dst.sh

宛先のアカウントを記述する。

```sh
cp account_template.sh account_dst.sh
vi account_dst.sh
```
のようにテンプレートからコピーして編集する。
アカウントのポリシーは、レポジトリの作成、書込、リストの権限が必要。

**重要**
このコンテナイメージをlambdaとして使うなら、
lambdaと同じリージョンを指定してください。

## config.sh

レポジトリの名前を設定する。
詳しくはこのファイル参照。


# 実行

```sh
./pull.sh  # ソースのECRからイメージをpullする
./tag.sh   # タグつける
./create-repository.sh  # 宛先にレポジトリ作る
./push.sh  # 宛先のECRにイメージをpushする
```

必要ならこれらを順番に実行するスクリプトでラップしてください。


# 補助スクリプト

```sh
# ↑で使ったimageを全部消す(そこそこディスクを喰うので)
./remove_images.sh
```


# その他メモ

dockerなしでなんとかならんのか考える。
今回は「とりあえずできる」ことの確認用。
