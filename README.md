# n8n on Render

n8n ワークフロー自動化プラットフォームを Render でセルフホスティングするプロジェクトです。

## 特徴

- Docker を使用した簡単デプロイ
- PostgreSQL データベース統合
- Basic 認証による安全なアクセス
- 永続化ストレージ対応
- HTTPS 対応

## 前提条件

- [Render](https://render.com) アカウント
- PostgreSQL データベース（Render PostgreSQL または外部サービス）

## デプロイ手順

### 1. リポジトリの準備

```bash
git clone <このリポジトリ>
cd n8n-on-render
```

### 2. Render での新しいサービス作成

1. Render ダッシュボードで「New +」→「Web Service」を選択
2. GitHub リポジトリを接続
3. 以下の設定を入力：
   - **Name**: `n8n-app`（任意の名前）
   - **Environment**: `Docker`
   - **Plan**: `Starter`（または必要に応じて）
   - **Auto-Deploy**: `Yes`

### 3. 環境変数の設定

Render ダッシュボードの Environment タブで以下の環境変数を設定：

#### 必須設定
- `N8N_BASIC_AUTH_USER`: 管理者ユーザー名
- `N8N_BASIC_AUTH_PASSWORD`: 管理者パスワード（強力なパスワードを設定）
- `N8N_HOST`: Render サービスのURL（例: `your-app-name.onrender.com`）
- `WEBHOOK_TUNNEL_URL`: Webhook用URL（例: `https://your-app-name.onrender.com`）
- `N8N_ENCRYPTION_KEY`: 32文字のランダム文字列

#### データベース設定
- `DB_POSTGRESDB_HOST`: PostgreSQL ホスト
- `DB_POSTGRESDB_DATABASE`: データベース名
- `DB_POSTGRESDB_USER`: データベースユーザー名
- `DB_POSTGRESDB_PASSWORD`: データベースパスワード

### 4. PostgreSQL データベースの設定

#### Render PostgreSQL を使用する場合
1. Render ダッシュボードで「New +」→「PostgreSQL」を選択
2. データベース作成後、接続情報を n8n サービスの環境変数に設定

#### 外部データベースを使用する場合
- 既存の PostgreSQL データベースの接続情報を環境変数に設定

### 5. デプロイ

設定完了後、Render が自動的にデプロイを開始します。

## アクセス方法

デプロイ完了後、`https://your-app-name.onrender.com` でアクセスできます。

設定した Basic 認証のユーザー名とパスワードでログインしてください。

## 注意事項

### セキュリティ
- 強力なパスワードを設定してください
- 定期的にパスワードを変更してください
- 本番環境では適切なアクセス制御を実装してください

### パフォーマンス
- Starter プランでは制限があります
- 本格的な利用には上位プランを検討してください

### データの永続化
- 重要なワークフローは定期的にバックアップしてください
- PostgreSQL データベースのバックアップも忘れずに

## トラブルシューティング

### よくある問題

**デプロイに失敗する**
- 環境変数が正しく設定されているか確認
- PostgreSQL データベースが利用可能か確認

**ログインできない**
- Basic 認証の設定を確認
- パスワードに特殊文字が含まれている場合はエスケープが必要な場合があります

**Webhook が動作しない**
- `WEBHOOK_TUNNEL_URL` が正しく設定されているか確認
- HTTPS が有効になっているか確認

### ログの確認

Render ダッシュボードの「Logs」タブでアプリケーションログを確認できます。

## 参考資料

- [n8n 公式ドキュメント](https://docs.n8n.io/)
- [Render ドキュメント](https://render.com/docs)
- [n8n Docker イメージ](https://hub.docker.com/r/n8nio/n8n)

## ライセンス

このプロジェクトは MIT ライセンスの下で公開されています。