class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :rents, :ccomment, :comment
  end
end
