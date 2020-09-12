class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.string :name, null: false
      t.integer :kind, null: false
      t.text :place
      t.text :memo
      t.date :date
      t.references :user, null:false, foreign_key: true
      t.timestamps
    end
  end
end
