# ミーティング調整サービス用インフラ設定

Ubuntu上に構築する想定でansible-playbookを使います。

## 使い方

- 接続先サーバーでSSH公開鍵認証接続を可能にしておきます。
- `app`, `db` ぞれぞれのディレクトリ内の `inventory/target.yml.dist` をコピーして `inventory/target.yml` を作成し、環境に応じて値を変更します。

- 実行ケースに応じてコマンドに指定するオプションを変更します。

  ```
  # playbookのシンタックスチェック
  ansible-playbook -i ./inventory/target.yml site.yml -vv --syntax-check

  # ドライラン
  ansible-playbook -i ./inventory/target.yml site.yml -vv --check

  # 実際に実行
  ansible-playbook -i ./inventory/target.yml site.yml -vv

  # 途中から実行
  ansible-playbook -i ./inventory/target.yml site.yml -vv --start-at="<途中から開始したいタスク名>"
  ```
