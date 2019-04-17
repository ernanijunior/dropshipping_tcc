class AddNameAdminToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :name_admin, :string
  end
end
