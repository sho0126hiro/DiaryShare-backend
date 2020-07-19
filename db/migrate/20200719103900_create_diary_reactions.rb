class CreateDiaryReactions < ActiveRecord::Migration[6.0]
  def change
    create_table :diary_reactions do |t|
      t.string :user_id, null: false
      t.integer :diary_id, null: false
      t.string :reaction_type, null: false
      t.timestamps
    end
    add_index :diary_reactions [:user_id, :diary_id], unique: true
  end
end
