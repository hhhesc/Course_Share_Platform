class Article < ApplicationRecord
  validates :content,:title, presence: true

  belongs_to :course
  belongs_to :user

  has_many :article_likes, foreign_key: "like_article_id", dependent: :destroy
  has_many :like_users, through: :article_likes, dependent: :destroy

  has_many :article_favors, foreign_key: "favor_article_id", dependent: :destroy
  has_many :favor_users, through: :article_favors, dependent: :destroy

  has_many :article_tags, dependent: :destroy
end
