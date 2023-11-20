class CreateCourseFiles < ActiveRecord::Migration[7.1]
  def change
    create_table :course_files do |t|
      t.references :course, null: false, foreign_key: true
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
