class Course < ApplicationRecord
  has_many :course_comments, dependent: :destroy
  has_many :articles
  has_many :course_scores
end
