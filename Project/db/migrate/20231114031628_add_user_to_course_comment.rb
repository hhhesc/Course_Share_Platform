class AddUserToCourseComment < ActiveRecord::Migration[7.1]
  def change
    add_reference :course_comments, :user, null: false, foreign_key: true
  end
end
