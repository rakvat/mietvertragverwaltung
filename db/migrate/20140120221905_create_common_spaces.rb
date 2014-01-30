class CreateCommonSpaces < ActiveRecord::Migration
  def change
    create_table :common_spaces do |t|
      t.float :value
      t.date :start

      t.timestamps
    end
  end
end
