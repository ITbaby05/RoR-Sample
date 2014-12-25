class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.string :room
      t.integer :floor
      t.integer :area
      t.decimal :price

      t.timestamps
    end
  end
end
