import base64
import hashlib
import os

# コードベリファイアをランダムに生成 (推奨: 32バイトのランダムなデータ)
code_verifier = os.urandom(32)
code_verifier_base64 = base64.urlsafe_b64encode(code_verifier).decode('utf-8').rstrip('=')

# SHA-256 ハッシュ関数を適用してコードチャレンジを生成
code_challenge = hashlib.sha256(code_verifier).digest()
code_challenge_base64 = base64.urlsafe_b64encode(code_challenge).decode('utf-8').rstrip('=')

print("コードベリファイア:", code_verifier_base64)
print("コードチャレンジ:", code_challenge_base64)