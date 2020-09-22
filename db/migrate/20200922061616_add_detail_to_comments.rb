class AddDetailToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :insects_id, :integer
  end
end
