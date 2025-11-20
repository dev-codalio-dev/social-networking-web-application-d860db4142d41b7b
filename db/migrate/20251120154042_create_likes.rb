class CreateLikes < ActiveRecord::Migration[7.2]
  def change
    create_table :likes do |t|
      t.references :post, null: false, foreign_key: true
      t.references :liker, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
    add_index :likes, [ :liker_id, :post_id ], unique: true
  end
end
