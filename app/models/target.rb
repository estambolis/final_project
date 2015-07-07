class Target < ActiveRecord::Base

validates :restaurant_id, :uniqueness => true


belongs_to :user
belongs_to :restaurant


end
