class Experience < ActiveRecord::Base
  validates :rating, :presence => true
  validates :restaurant_id, :presence => true
  validates :date, :presence => true


  belongs_to :user
  belongs_to :restaurant

   mount_uploader :image, ImageUploader

end
