class CreateQuestionReplies < ActiveRecord::Migration[7.1]
  def change
    create_table :question_replies do |t|
      t.references :question, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :content
      t.integer :accepted, default: 0

      t.timestamps
    end
  end
end
