class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :post_code,       null:false
      t.integer :prefecture_id,  null: false
      t.string :city,            null: false
      t.string :house_number
      t.string :building_name 
      t.references :user,         null: false, foreign_key: 
      t.timestamps
    end
  end
end
