## Amazon Music APIについて

## 概要

- Program Overview
  - https://developer.amazon.com/ja/docs/music/API_web_overview.html
- APIs Overview
  - https://developer.amazon.com/ja/docs/music/API_web_overview.html


### 注意
> The APIs are currently in Beta status and access is limited to approved developers. If you have a compelling business case and need access to the APIs reach out to your Amazon Point of Contact. If you don't have a POC, you may use the [contact us form]
APIは現在ベータ版で、アクセスは承認された開発者に限られている。説得力のあるビジネスケースがあり、APIへのアクセスが必要な場合は、Amazonの担当窓口までご連絡ください。POCをお持ちでない場合は、[お問い合わせフォーム]をご利用ください。

Amazon Music APIはベータ版であり、利用するにはAmazon担当窓口に問い合わせる必要がある。

## クライアント情報の取得方法について

- 開発者コンソールに登録する
  - https://developer.amazon.com/dashboard
- Login with Amazon でセキュリティプロファイルを作成する
  - プライバシー規約同意書URLを登録する
  - 許可された返信URLにリダイレクトURLを登録する（HTTPS）
  - https://developer.amazon.com/loginwithamazon/console/site/lwa/overview.html
- セキュリティプロファイルからクライアントIDとクライアントシークレットを取得する


## PKCE（Proof Key for Code Exchange）フローを実行する

PKCE（Proof Key for Code Exchange）フローは、OAuth 2.0の拡張で、特に公開クライアント（例えば、モバイルアプリケーションやSPA（Single Page Application）など、クライアントシークレットを安全に保持できない環境）での認証と認可プロセスをより安全にするため認証方法。このフローは、特に認証コード（Authorization Code）フローを使用するアプリケーションでの攻撃リスクを軽減する。

### PKCEフローの手順
1. コードベリファイアの生成:クライアントはランダムな文字列（コードベリファイア）を生成する
2. コードチャレンジの生成:クライアントは、コードベリファイアをSHA-256でハッシュ化し、その結果をBase64 URLエンコードすることでコードチャレンジを生成する
3. 認可リクエストの送信:クライアントは、生成したコードチャレンジと共に認可サーバーへの認可リクエストを送信する。このリクエストには、code_challengeとcode_challenge_method（例：S256）を含める。
4. ユーザー認証と認可:ユーザーは認証サーバーで認証し、クライアントへのアクセスを承認する
5. 認証コードの受け取り:クライアントはリダイレクトURIを介して認証コードを受け取る
6. トークンリクエストの送信:クライアントは認証コードと共に、元のコードベリファイアを使用してトークンリクエストを認可サーバーに送信する
7. アクセストークンの受け取り:認証サーバーは、コードチャレンジとコードベリファイアの対を検証し、検証が成功するとアクセストークン（およびオプションでリフレッシュトークン）をクライアントに発行する