class Course < ApplicationRecord
  attr_accessor :remove_course_file

  has_many :course_comments, dependent: :destroy
  has_many :articles
  has_many :course_scores

  has_many :course_files

  has_many :questions
end
