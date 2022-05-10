ECRから別のECRにイメージをコピーするスクリプト。

# 必要なもの

- docker
- AWS CLI
- ソースと宛先のAWSアカウントのAPIキー


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


# 実行

```sh
./pull.sh  # ソースのECRからイメージをpullする
./tag.sh   # タグつける
./create-repository.sh  # 宛先にレポジトリ作る
./push.sh  # 宛先のECRにイメージをpushする
```

必要ならこれらを順番に実行するスクリプトでラップしてください。
