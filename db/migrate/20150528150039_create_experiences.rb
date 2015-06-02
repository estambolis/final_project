class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.text :comments
      t.string :best
      t.string :worst
      t.date :date
      t.integer :rating
      t.integer :restaurant_id
      t.integer :user_id

      t.timestamps

    end
  end
end
