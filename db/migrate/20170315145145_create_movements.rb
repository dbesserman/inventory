class CreateMovements < ActiveRecord::Migration[5.0]
  def change
    create_table :movements do |t|
      t.boolean :booked, :comming_in
      t.integer :quantity, :reference_id
      t.timestamps
    end
  end
end
