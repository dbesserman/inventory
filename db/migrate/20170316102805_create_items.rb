class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer :movement_id
      t.boolean :booked, :in_stock
      t.timestamps
    end
  end
end
