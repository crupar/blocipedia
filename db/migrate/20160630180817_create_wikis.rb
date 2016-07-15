class CreateWikis < ActiveRecord::Migration
  def change
    create_table :wikis do |t|
      t.string :title
      t.text :body
      t.boolean :private, default: false
      t.references :user, index: true, foreign_key: true
      t.boolean :public, default: true, null: false

      t.timestamps null: false
    end
  end
end
