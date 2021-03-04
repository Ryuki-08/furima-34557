class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string :name,                  null: false
      t.text :name_description,        null: false
      t.integer :category_id,          null: false
      t.integer :product_condition_id, null: false
      t.integer :shipping_charges_id,  null: false
      t.integer :prefectures_id,       null: false
      t.integer :days_to_ship_id,      null: false
      t.integer :price,                nill: false
      t.references :user,              foreign_key: true

      t.timestamps
    end
  end
end
