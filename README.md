# ミーティング調整サービス用インフラ設定

Ubuntu上に構築する想定でansible-playbookを使います。

## 使い方

- 接続先サーバーでSSH公開鍵認証接続を可能にしておきます。

- 以下のファイルをコピー＆リネームし、環境に応じて値を変更します。
  - control-node.dist.yml -> control-node.yml
  - group_vars/webservers.dist.yml -> group_vars/webservers.yml
  - host_vars/web-01.dist.yml -> host_vars/web-01.yml
  - host_vars/db-01.dist.yml -> host_vars/db-01.yml

- 実行ケースに応じてコマンドに指定するオプションを変更します。

  ```
  # playbookのシンタックスチェック
  ansible-playbook -vv --syntax-check -i ./production.yml --extra-vars @control-node.yml --extra-vars @secrets.yml --vault-password-file <Ansible Vaultのパスワード ファイルのパス> site.yml

  # ドライラン
  ansible-playbook -vv --check -i ./production.yml --extra-vars @control-node.yml --extra-vars @secrets.yml --vault-password-file <Ansible Vaultのパスワード ファイルのパス> site.yml

  # 実際に実行
  ansible-playbook -vv -i ./production.yml --extra-vars @control-node.yml --extra-vars @secrets.yml --vault-password-file <Ansible Vaultのパスワード ファイルのパス> site.yml

  # 途中から実行
  ansible-playbook -vv -i ./production.yml --extra-vars @control-node.yml --extra-vars @secrets.yml --vault-password-file <Ansible Vaultのパスワード ファイルのパス> --start-at="<途中から開始したいタスク名>" site.yml
  ```

- システムの動作に必要な環境間で不変の機密情報を `secrets.yml` として Ansible Vault で暗号化しています。
  - 値を確認する場合

    ```shell
    ansible-vault view --vault-password-file <Ansible Vaultのパスワード ファイルのパス> ./secrets.yml
    ```

  - 編集する場合

    ```shell
    ansible-vault edit --vault-password-file <Ansible Vaultのパスワード ファイルのパス> ./secrets.yml
    ```
