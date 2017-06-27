class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :content, null: false
      t.integer :user_id
      t.integer :post_id
      t.timestamps
    end
    add_index(:comments, [:user_id, :post_id])
  end
end
