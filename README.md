
# PICTURE BOOK
### 子供と一緒に出かけよう！
 - 子供とのお出かけを、より楽しくする為に作りました！
 - 写真を撮って、投稿することで、自分の『生き物図鑑』を作ることができます。
 - 動物園、水族館、虫取り等、子供と過ごした思い出作りを。

## 概要
 - 見つけた生き物の写真、名前、種類、見つけた場所、日にち、コメントを投稿できる。
 ![result](https://user-images.githubusercontent.com/69187127/94989628-387d0600-05b1-11eb-9b42-9fec14b10e62.gif)
 - 全てのユーザーと自分が投稿した記事の一覧表示を切り替えられる。
<img width="618" alt="picture_book_sample3" src="https://user-images.githubusercontent.com/69187127/94989893-e0470380-05b2-11eb-8571-77c3b8a05a41.png">
 - 投稿内容の詳細を見ることができる。
 ![picture_book_sample1](https://user-images.githubusercontent.com/69187127/94989744-f6a08f80-05b1-11eb-8a17-5ac9824ed75f.jpg)
 - 名前、種類、場所、日にちで記事を検索することができる。
 <img width="222" alt="picture_book_sample4" src="https://user-images.githubusercontent.com/69187127/94989916-13899280-05b3-11eb-94d9-b8ffe9b53329.png">
 - 今どの種類の生き物を何種類見つけたかを確認できる。
  <img width="609" alt="picture_book_sample2" src="https://user-images.githubusercontent.com/69187127/94989814-66af1580-05b2-11eb-98b0-8757a0860eb4.png">

## バージョン
 - ruby 2.6.5
 - rails 6.0.0

## 実装機能

### 記事関連
 - 一覧表示機能
 - 記事新規投稿機能
 - 記事編集機能
 - 記事詳細表示機能
 - 記事削除機能
 - マイページでの記事一覧表示機能
 - キーワード検索機能
 - 記事カテゴリ別の投稿数表示機能
  
### ユーザー関連
 - 登録機能
 - ログイン・ログアウト機能




### usersテーブル
 | column  | type   |  options   |
 |---------|--------|------------|
 |name     | string | null:false |
 |email    | string | null:false |
 |profile  | text   |            |
 

association
- has_many :contents
- has_many :comments


### contents テーブル
 |column | type       | options                       |
 |-------|------------|-------------------------------|
 |name   | string     |  null:false                   |
 |kind   | integer    |  null:false                   | 
 |place  | text       |                               |
 |memo   | text       |                               |
 |user   | references | null:false, foreign_key: true |

association 
- has_many :comments
- belongs_to :user
- has_one_attached :image

