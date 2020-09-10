# README

# usersテーブル
 | column  | type   |  options   |
 |---------|--------|------------|
 |nickname | string | null:false |
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
 |kind   | string     |                               |
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