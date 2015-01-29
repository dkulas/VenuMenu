class AddUserNameToComments < ActiveRecord::Migration
  def change
    add_column :comments, :user_name, :string
  end
end
