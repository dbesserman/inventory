class RemoveBookedFromMovements < ActiveRecord::Migration[5.0]
  def change
    change_table :movements do |t|
      t.remove :booked
    end
  end
end
