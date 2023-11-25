class CourseComment < ApplicationRecord
  belongs_to :course
  belongs_to :user

  has_many :course_comment_likes, foreign_key:"like_course_comment_id"
  has_many :like_users, through: :course_comment_likes
end
