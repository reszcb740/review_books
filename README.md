# review_books

## サイトの概要
### サイトテーマ
本を投稿してレビューやコメントなどができ、検索、ランキングが充実しているサイト


### テーマを選んだ理由
本を読むことが好きなので、本のレビュー、コメントができるサイトを作ろうと考え、加えてジャンル検索を付けることで自分の好きなジャンルを選ぶことができること、ランキングをつけることで本に対しての興味を持ってもらえるサイトにしようと考えたから

### ターゲットユーザー
本の好きな人（会員）
本に興味のある人
### 主な利用シーン
- 本に対してレビュー、コメントを書く時
- ランキングを付けて、本に対しての興味をもってもらう時
- 小説、ファンタジーなどの本の検索をする時
-  会員でもなくても閲覧する時
## 設計書
- ER図: https://app.diagrams.net/#G1kSnqDRdCi48pO5Z9lXgKEV0gcq31X9mk
- テーブル定義書: https://docs.google.com/spreadsheets/d/1sNMGttu2XQ-QNGAVdQW4aUKgygYzjjrEq62tz05FtA8/edit#gid=1309140826
- アプリケーション詳細設計: https://docs.google.com/spreadsheets/d/1fEESgu6kROwmmVf3Gh3tlofKzcEhfPiu5nVPjnpLblo/edit#gid=979035707
- テスト仕様書: https://docs.google.com/spreadsheets/d/1_YmKucaw_oGWC6wW9cpV9vUC-ufLPIJo/edit#gid=2072448154
- 会員側のワイヤーフレーム: https://app.diagrams.net/#G15vT1CSCQjhfnJKMrBtj4Pa7L9BEWFb8K
- 管理者側のワイヤーフレーム: https://app.diagrams.net/#G11O5OPfmiwhrPXjwstSV1NvBiQZ6RgdVj

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

## 使用素材
- no_image,sample_author1などの画像
- fontawesome
- bootstrap
- footerにCopyRight Infratop.incをお借りしています

## 主な役割
- 会員側: 本の投稿・コメント・編集・削除・レビュー・ブックマークなど、また本のジャンルも追加・編集できるようにしています。
- 本の投稿一覧にジャンル検索・ランキングを実装しています。退会もできるようにしています。

- 管理者側: 会員一覧や会員の編集・退会情報など、会員の本の投稿を見れるようにしています。
- resources :booksを持っていますが、管理者側は不適切なレビューを編集したり、コメントを削除することを主にしています。

