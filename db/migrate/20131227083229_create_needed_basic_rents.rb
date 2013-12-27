class CreateNeededBasicRents < ActiveRecord::Migration
  def change
    create_table :needed_basic_rents do |t|
      t.float :value
      t.date :start

      t.timestamps
    end
  end
end
