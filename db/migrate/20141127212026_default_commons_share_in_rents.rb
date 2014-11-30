class DefaultCommonsShareInRents < ActiveRecord::Migration
  def change
    change_column :rents, :commons_share, :integer, :default => 1
  end
end
