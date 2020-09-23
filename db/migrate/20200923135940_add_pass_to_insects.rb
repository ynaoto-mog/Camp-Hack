class AddPassToInsects < ActiveRecord::Migration[6.0]
  def change
    add_column :insects, :pass, :string
  end
end
