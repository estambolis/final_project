class AddFoodTypeToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :food_type, :string
  end
end
