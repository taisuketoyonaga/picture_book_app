class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :comment , presence: true
      t.references :user , presence: true
      t.references :content, presence: true
      t.timestamps
    end
  end
end
