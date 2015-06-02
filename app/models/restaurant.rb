class Restaurant < ActiveRecord::Base
validates :venue_name, :presence => true, :uniqueness => true

has_many :experiences

end
