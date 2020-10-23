class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string :postal_code,null: false
      t.integer :area_id,null: false
      t.string :cities,null: false
      t.text :add,null: false
      t.string :bill_name
      t.string :phone,null: false
      t.references :buy,null: false,foreign_key: true

      t.timestamps
    end
  end
end
