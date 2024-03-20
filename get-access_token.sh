# クライアントID
CLIENT_ID=""

# クライアントシークレット
CLIENT_SECRET=""

# 認証コード
CODE=""

# リダイレクトURI
REDIRECT_URI="https://localhost:8443"

# コードベリファイア
CODE_VERIFIER=""

curl -X POST "https://api.amazon.com/auth/o2/token" \
     -H "Content-Type: application/x-www-form-urlencoded" \
     -d "grant_type=authorization_code" \
     -d "code=${CODE}" \
     -d "redirect_uri=${REDIRECT_URI}" \
     -d "client_id=${CLIENT_ID}" \
     -d "client_secret=${CLIENT_SECRET}" \
     -d "code_verifier=${CODE_VERIFIER}" | jq