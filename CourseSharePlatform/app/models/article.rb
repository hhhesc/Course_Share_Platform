class Article < ApplicationRecord
  belongs_to :course
  belongs_to :user

  has_many :article_likes, foreign_key: "like_article_id"
  has_many :like_users, through: :article_likes
end
