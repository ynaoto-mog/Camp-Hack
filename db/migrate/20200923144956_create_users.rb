class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
