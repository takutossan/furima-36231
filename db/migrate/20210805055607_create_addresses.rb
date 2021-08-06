class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :zip_code, null: false
      t.integer :shipper_id, null: false
      t.string :municipalities, null: false
      t.string :street_number, null: false
      t.string :telephone_number, null: false
      t.string :building
      t.references :buyer, null: false, foreign_key: true
      t.timestamps
    end
  end
end
