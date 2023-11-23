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

  has_many :course_scores
  has_many :courses, through: :course_scores

  has_many :course_comment_likes, foreign_key: "like_user_id"
  has_many :like_course_comments, through: :course_comment_likes

  has_many :article_likes, foreign_key: "like_user_id"
  has_many :like_articles, through: :article_likes

  has_many :article_favors, foreign_key: "favor_user_id"
  has_many :favor_articles, through: :article_favors

  has_many :questions
  has_many :question_replies
end
