json.extract! article, :id, :course_id, :user_id, :title, :content, :created_at, :updated_at
json.url article_url(article, format: :json)
