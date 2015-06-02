class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :venue_name

      t.timestamps

    end
  end
end
