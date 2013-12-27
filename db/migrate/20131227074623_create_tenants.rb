class CreateTenants < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      t.string :prename
      t.string :name
      t.string :current_street_no
      t.string :current_zip_code_city

      t.timestamps
    end
  end
end
