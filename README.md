# README

# usersテーブル
  -------------------------------
 |nickname | string | null:false |
 |name     | string | null:false |
 |email    | string | null:false |
 |profile  | text   |            |
 --------------------------------

association　
- has_many :contents
- has_many :comments


# contents テーブル
  ---------------------------------------
 |name  | string     |  null:false       |
 |kind  | string     |                   |
 |place | text       |                   |
 |memo  | text       |                   |
 |user  | references | foreign_key: true |
  ---------------------------------------
association 
- has_many :comments
- belongs_to :user

# comments　テーブル
  -------------------------------------------
 | comment  | text       | null:false        |
 | user     | references | foreign_key: true |
 | contents | references | foreign_key: true |
  -------------------------------------------
association
- belongs_to :content
- belongs_to :user