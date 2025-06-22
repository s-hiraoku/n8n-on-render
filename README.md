# n8n on Render

n8n ワークフロー自動化プラットフォームを Render で簡単にセルフホスティングできます。

## 特徴

- Docker を使用した簡単デプロイ
- SQLite データベース（設定不要）
- Basic 認証による安全なアクセス
- 永続化ストレージ対応
- HTTPS 自動対応

## 前提条件

- [Render](https://render.com) アカウントのみ

## クイックスタート

### 1. Render でサービス作成

1. [Render](https://render.com) にログイン
2. 「New +」→「Web Service」を選択
3. このリポジトリを接続: `https://github.com/s-hiraoku/n8n-on-render`
4. 設定：
   - **Name**: `n8n-app`（任意）
   - **Environment**: `Docker`
   - **Plan**: `Starter`
   - **Auto-Deploy**: `Yes`

### 2. 環境変数の設定

Environment タブで以下の4つを設定：

- `N8N_BASIC_AUTH_USER`: `admin`（または任意のユーザー名）
- `N8N_BASIC_AUTH_PASSWORD`: 強力なパスワード
- `N8N_HOST`: `your-app-name.onrender.com`（実際のサービス名）
- `WEBHOOK_TUNNEL_URL`: `https://your-app-name.onrender.com`

### 3. デプロイ

「Create Web Service」をクリックして完了！

## アクセス方法

デプロイ完了後、`https://your-app-name.onrender.com` でアクセス。
設定した Basic 認証でログインしてください。

## 注意事項

- Starter プランは制限があります
- 重要なワークフローは定期的にバックアップを
- ログは Render ダッシュボードの「Logs」タブで確認

## 参考資料

- [n8n 公式ドキュメント](https://docs.n8n.io/)
- [Render ドキュメント](https://render.com/docs)