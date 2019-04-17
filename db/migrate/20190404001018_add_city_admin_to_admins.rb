class AddCityAdminToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :city_admin, :string
    add_column :admins, :last_name_admin, :string
    add_column :admins, :street_admin, :string
    add_column :admins, :zip_code_admin, :string
  end
end
