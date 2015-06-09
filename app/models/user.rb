class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, :uniqueness => true

  validates :email, :presence => true, :uniqueness => true

  has_many :experiences

  has_many :restaurants, :through => :experiences

end
