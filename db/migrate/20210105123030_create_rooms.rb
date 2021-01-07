class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :rooms_name,          null:false
      t.references :job,             null: false, foreign_key: true

      t.timestamps
    end
  end
end
