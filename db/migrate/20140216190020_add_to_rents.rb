class AddToRents < ActiveRecord::Migration
  def change
    add_column :rents, :custom_heating, :float
    add_column :rents, :custom_assessory, :float
    add_column :rents, :ccomment, :string
  end
end
