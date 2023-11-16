class ArticleLike < ApplicationRecord
    belongs_to :like_articles, class_name: "Article", foreign_key: "like_article_id"
    belongs_to :like_users, class_name: "User", foreign_key: "like_user_id"
end