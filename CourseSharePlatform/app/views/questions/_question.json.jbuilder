json.extract! question, :id, :course_id, :user_id, :title, :content, :solved, :created_at, :updated_at
json.url question_url(question, format: :json)
