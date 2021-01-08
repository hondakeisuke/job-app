class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :order_title,           null:false
      t.text :order_detail,            null:false
      t.string :period ,               null:false
      t.string :order_price,           null:false
      t.integer :category_id ,         null:false
      t.string :job_post_code,         null:false
      t.integer :prefecture_id ,       null:false
      t.string :job_city,              null:false
      t.string :job_house_number
      t.string :building_name   
      t.references :user,               null:false, foreign_key: true
      
      

      t.timestamps
    end
  end
end
