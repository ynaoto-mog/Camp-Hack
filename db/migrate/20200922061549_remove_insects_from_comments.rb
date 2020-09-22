class RemoveInsectsFromComments < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :insects, :integer
  end
end
