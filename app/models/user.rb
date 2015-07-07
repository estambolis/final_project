class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, :presence => true, :uniqueness => true

  validates :email, :presence => true, :uniqueness => true

  has_many :experiences

  has_many :restaurants, :through => :experiences

  has_many :targets


  has_many :friend_requests_where_sender, :class_name => "Follow", :foreign_key => "sender_id"
  has_many :friends_where_sender, :through => :friend_requests_where_sender, :source => :receiver

  has_many :friend_requests_where_receiver, :class_name => "Follow", :foreign_key => "receiver_id"
  has_many :friends_where_receiver, :through => :friend_requests_where_receiver, :source => :sender

  has_many :followed_experiences, :through => :friends_where_sender, :source => :experiences

end
