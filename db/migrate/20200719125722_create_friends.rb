class CreateFriends < ActiveRecord::Migration[6.0]
  def change
    create_table :friends do |t|
      t.string :user_id
      t.string :friend_id
      t.string :status

      t.timestamps
    end
    add_index :friends, [:user_id, :friend_id], unique: true
  end
end
