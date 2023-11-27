class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email,:username, uniqueness: true
  validates :studentcode, uniqueness: true, allow_blank: true
  validates :email,:username,:password, presence: true

  has_many :course_comments, dependent: :destroy

  has_many :followships, dependent: :destroy
  has_many :reverse_followships, class_name:"Followship", foreign_key:"following_user_id", dependent: :destroy
  has_many :followings, through: :followships, dependent: :destroy
  has_many :followers, through: :reverse_followships, dependent: :destroy

  has_many :course_scores, dependent: :destroy
  has_many :courses, through: :course_scores, dependent: :destroy

  has_many :course_comment_likes, foreign_key: "like_user_id", dependent: :destroy
  has_many :like_course_comments, through: :course_comment_likes, dependent: :destroy

  has_many :article_likes, foreign_key: "like_user_id", dependent: :destroy
  has_many :like_articles, through: :article_likes, dependent: :destroy

  has_many :article_favors, foreign_key: "favor_user_id", dependent: :destroy
  has_many :favor_articles, through: :article_favors, dependent: :destroy

  has_many :questions, dependent: :destroy
  has_many :question_replies, dependent: :destroy

  has_many :articles
end
