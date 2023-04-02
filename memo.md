# ミドルウェア設定 作業メモ

## PostgreSQL

- `/etc/postgresql/14/main/postgresql.conf`
  - `listen_addresses = '*'` へ変更する。

- `/etc/postgresql/14/main/pg_hba.conf`
  - 以下の設定箇所の下へ、`host all all <接続を許可する接続元のCIDR表記> trust` を追加する。

    ```
    # IPv4 local connections:
    host    all             all             127.0.0.1/32            scram-sha-256
    ```

- 設定終了後に サービス `postgresql` `postgresql@14-main` を再起動する。
