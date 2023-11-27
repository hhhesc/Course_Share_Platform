class CourseComment < ApplicationRecord
  validates :content, presence: true
  belongs_to :course
  belongs_to :user

  has_many :course_comment_likes, foreign_key:"like_course_comment_id", dependent: :destroy
  has_many :like_users, through: :course_comment_likes, dependent: :destroy
end
