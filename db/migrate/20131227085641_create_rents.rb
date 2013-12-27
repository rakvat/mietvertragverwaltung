class CreateRents < ActiveRecord::Migration
  def change
    create_table :rents do |t|
      t.date :start
      t.float :basic_rent
      t.references :room, index: true
      t.references :tenant, index: true

      t.timestamps
    end
  end
end
