class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :pass, null: false
      t.string :email, unique: true, null: false
      t.string :public_uid, unique: true, null: false
      t.string :token, null: false

      t.timestamps
    end
    add_index :users, :token, unique: true
  end
end
