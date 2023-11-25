json.extract! question_reply, :id, :question_id, :user_id, :content, :valid, :created_at, :updated_at
json.url question_reply_url(question_reply, format: :json)
