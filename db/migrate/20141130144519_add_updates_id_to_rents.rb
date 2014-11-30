class AddUpdatesIdToRents < ActiveRecord::Migration
  def change
    change_table :rents do |t|
      t.references :rent, :previous_contract
    end
  end
end
