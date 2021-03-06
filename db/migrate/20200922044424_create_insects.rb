class CreateInsects < ActiveRecord::Migration[6.0]
  def change
    create_table :insects do |t|
      t.string :name
      t.text :description
      t.float :latitude
      t.float :longitude
      t.integer :category_id
      t.date :date
      t.string :prfc
      t.string :hour
      t.text :image

      t.timestamps
    end
  end
end
