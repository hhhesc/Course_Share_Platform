json.extract! course_comment, :id, :course_id, :content, :created_at, :updated_at
json.url course_comment_url(course_comment, format: :json)
