json.extract! course, :id, :course_name, :course_description, :created_at, :updated_at
json.url course_url(course, format: :json)
