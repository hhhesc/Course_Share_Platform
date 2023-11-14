class AddStudentcodeToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :studentcode, :string
  end
end
