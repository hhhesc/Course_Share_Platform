class Course < ApplicationRecord
  attr_accessor :remove_course_file
  validates :course_name, presence: true

  has_many :course_comments, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :course_scores, dependent: :destroy

  has_many :course_files, dependent: :destroy

  has_many :questions, dependent: :destroy
end
