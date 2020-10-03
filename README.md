
# PICTURE BOOK

# 概要
## 子供と一緒に出かけよう！
 ・子供とのお出かけを、より楽しくする為に作りました！
 ・自分の生き物図鑑を作ることができます。
 ・動物園、水族館、虫取り等、生き物がいるところで

# usersテーブル
 | column  | type   |  options   |
 |---------|--------|------------|
 |name     | string | null:false |
 |email    | string | null:false |
 |profile  | text   |            |
 

association
- has_many :contents
- has_many :comments


# contents テーブル
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

# comments テーブル
 |column    | type       | options                       |
 |----------|------------|-------------------------------|
 | comment  | text       | null:false                    |
 | user     | references | null:false, foreign_key: true |
 | contents | references | null:false, foreign_key: true |
  
association
- belongs_to :content
- belongs_to :user