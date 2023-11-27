class RemoveValidFromQuestionReply < ActiveRecord::Migration[7.1]
  def change
    remove_column :question_replies, :valid, :integer
  end
end
