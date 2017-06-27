class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :url
      t.string :content
      t.integer :sub_id
      t.integer :user_id
      t.timestamps
    end
    add_index(:posts, [:sub_id, :user_id])
  end
end
