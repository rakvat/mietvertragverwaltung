class CreateNeededHeatingCharges < ActiveRecord::Migration
  def change
    create_table :needed_heating_charges do |t|
      t.float :value
      t.date :start

      t.timestamps
    end
  end
end
