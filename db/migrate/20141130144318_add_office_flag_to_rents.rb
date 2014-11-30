class AddOfficeFlagToRents < ActiveRecord::Migration
  def change
    add_column :rents, :is_office, :boolean, default: false
  end
end
