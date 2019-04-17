class AddNameUserToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name_user, :string
    add_column :users, :city_user, :string
    add_column :users, :last_name_user, :string
    add_column :users, :street_user, :string
    add_column :users, :zip_code_user, :string
  end
end
