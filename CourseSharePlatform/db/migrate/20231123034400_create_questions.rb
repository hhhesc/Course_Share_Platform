class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.references :course, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :content
      t.integer :solved, default: 0

      t.timestamps
    end
  end
end
