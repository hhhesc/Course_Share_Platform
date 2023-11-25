class ArticleFavor < ApplicationRecord
    belongs_to :favor_articles, class_name: "Article", foreign_key: "favor_article_id"
    belongs_to :favor_users, class_name: "User", foreign_key: "favor_user_id"
end