FROM n8nio/n8n

# Basic認証を一旦無効にして起動確認
ENV N8N_BASIC_AUTH_ACTIVE=false

# 永続化用のディレクトリ
VOLUME /home/node/.n8n

EXPOSE 5678

# n8n公式イメージのエントリーポイントを使用
CMD ["tini", "--", "/usr/local/bin/docker-entrypoint.sh", "n8n"]