class AddQuestionToInsects < ActiveRecord::Migration[6.0]
  def change
    add_column :insects, :question, :boolean
  end
end
