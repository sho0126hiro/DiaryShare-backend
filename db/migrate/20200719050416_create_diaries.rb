class CreateDiaries < ActiveRecord::Migration[6.0]
  def change
    create_table :diaries do |t|
      t.string :user_id, null: false
      t.string :status, null: false
      t.string :title, null: false
      t.string :content, null: false
      t.timestamps
    end
  end
end
