class AddUseridToInsects < ActiveRecord::Migration[6.0]
  def change
    add_column :insects, :user_id, :integer
  end
end
