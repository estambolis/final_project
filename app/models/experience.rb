class Experience < ActiveRecord::Base
  validates :rating, :presence => true

  belongs_to :user
  belongs_to :restaurant

end
