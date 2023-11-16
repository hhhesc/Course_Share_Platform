class Article < ApplicationRecord
  belongs_to :course
  belongs_to :user

  has_many :article_likes, foreign_key: "like_article_id"
  has_many :like_users, through: :article_likes

  has_many :article_favors, foreign_key: "favor_article_id"
  has_many :favor_users, through: :article_favors
end
