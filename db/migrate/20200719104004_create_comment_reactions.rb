class CreateCommentReactions < ActiveRecord::Migration[6.0]
  def change
    create_table :comment_reactions do |t|
      t.string :user_id, null: false
      t.string :comment_id, null: false
      t.string :reaction_type, null: false
      t.timestamps
    end
    add_index :comment_reactions, [:user_id, :comment_id], unique: true
  end
end
