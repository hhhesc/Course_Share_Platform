class CreateCourseScore < ActiveRecord::Migration[7.1]
  def change
    create_table :course_scores do |t|
      t.float :course_score
      t.references :course, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
