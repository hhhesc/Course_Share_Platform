json.extract! course_file, :id, :course_id, :title, :description, :created_at, :updated_at
json.url course_file_url(course_file, format: :json)
