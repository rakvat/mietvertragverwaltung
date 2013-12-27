class CreateTotalSquareMeters < ActiveRecord::Migration
  def change
    create_table :total_square_meters do |t|
      t.integer :value
      t.date :start

      t.timestamps
    end
  end
end
