class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code,          null: false
      t.integer :prefecture_id,       null: false
      t.string :city,                 null: false
      t.string :address,              null: false
      t.string :building_name,        null: false
      t.string :tel,                  null: false
      t.references :item_transaction, null: false,foreign_key: true
      t.timestamps
    end
  end
end
