class AddCityAndStateToComments < ActiveRecord::Migration
  def change
    add_column :comments, :city_and_state, :string
  end
end
