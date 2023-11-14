class CreateCourseComments < ActiveRecord::Migration[7.1]
  def change
    create_table :course_comments do |t|
      t.references :course, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
