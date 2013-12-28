class RentedRoom < ActiveRecord::Migration
  def change
    create_table :rented_rooms do |t|
      t.references :room, index: true
      t.references :rent, index: true

      t.timestamps
    end
  end
end
