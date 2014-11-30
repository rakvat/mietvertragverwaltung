class AddCommonsShareToRents < ActiveRecord::Migration
  def change
    add_column :rents, :commons_share, :integer
  end
end
