class CourseCommentLike < ApplicationRecord
    belongs_to :like_course_comments, class_name: "CourseComment", foreign_key: "like_course_comment_id"
    belongs_to :like_users, class_name: "User", foreign_key: "like_user_id"
end