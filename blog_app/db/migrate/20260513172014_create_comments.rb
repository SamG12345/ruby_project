class CreateComments < ActiveRecord::Migration[8.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :parent_id
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
    add_index :comments, :parent_id
  end
end
