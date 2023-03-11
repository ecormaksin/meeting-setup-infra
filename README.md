# ミーティング調整サービス用インフラ設定

Ubuntu上に構築する想定でansible-playbookを使います。

## 使い方

- 接続先サーバーでSSH公開鍵認証接続を可能にしておきます。
- 以下のファイルをコピー＆リネームし、環境に応じて値を変更します。
  - production.yml.dist -> production.yml
  - host_vars/web-01.yml.dist -> host_vars/web-01.yml
  - host_vars/db-01.yml.dist -> host_vars/db-01.yml

- 実行ケースに応じてコマンドに指定するオプションを変更します。

  ```
  # playbookのシンタックスチェック
  ansible-playbook -i ./production.yml site.yml -vv --syntax-check

  # ドライラン
  ansible-playbook -i ./production.yml site.yml -vv --check

  # 実際に実行
  ansible-playbook -i ./production.yml site.yml -vv

  # 途中から実行
  ansible-playbook -i ./production.yml site.yml -vv --start-at="<途中から開始したいタスク名>"
  ```
