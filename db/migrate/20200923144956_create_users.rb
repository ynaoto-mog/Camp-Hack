class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :nick_name
      t.integer :login_id
      t.string :password

      t.timestamps
    end
  end
end
