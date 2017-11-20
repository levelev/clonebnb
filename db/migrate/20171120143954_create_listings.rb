class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.integer :zip
      t.string :city
      t.string :image
      t.string :category

      t.timestamps
    end
  end
end
