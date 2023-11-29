class CourseFile < ApplicationRecord
  validates :title, presence: true
  validates :file, presence: true
  belongs_to :course
  has_one_attached :file, dependent: :destroy
end
