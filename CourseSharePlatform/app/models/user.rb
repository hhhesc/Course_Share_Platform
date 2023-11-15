class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, uniqueness: true
  validates :username, uniqueness: true

  has_many :course_comments

  has_many :followships
  has_many :reverse_followships, class_name:"Followship", foreign_key:"following_user_id"
  has_many :followings, through: :followships
  has_many :followers, through: :reverse_followships

  # attr_accessor :username
end
