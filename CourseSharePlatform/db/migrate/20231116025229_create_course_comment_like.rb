class CreateCourseCommentLike < ActiveRecord::Migration[7.1]
  def change
    create_table :course_comment_likes do |t|
      t.references :like_user, null: false, foreign_key: {to_table: :users}
      t.references :like_course_comment, null: false, foreign_key: {to_table: :course_comments}

      t.timestamps
    end
  end
end
