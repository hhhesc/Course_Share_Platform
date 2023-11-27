class CourseScore < ApplicationRecord
    validates :course_score, presence: true
    belongs_to :course
    belongs_to :user
end
