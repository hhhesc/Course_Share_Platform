class Course < ApplicationRecord
  has_many :course_comments, dependent: :destroy
end
