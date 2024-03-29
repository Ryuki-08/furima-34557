class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code,  null: false
      t.integer :prefectures_id,  null: false
      t.string :municipality,  null: false
      t.string :building_name
      t.string :house_number,  null: false
      t.string :phone_number,  null: false
      t.references :buy,  foreign_key: true
      t.timestamps
    end
  end
end
