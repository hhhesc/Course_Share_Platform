class Question < ApplicationRecord
  validates :content,:title, presence: true
  belongs_to :course
  belongs_to :user

  has_many :question_replies, dependent: :destroy
end
