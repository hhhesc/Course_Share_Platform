class Course < ApplicationRecord
  has_many :course_comments, dependent: :destroy
  has_many :articles
end
