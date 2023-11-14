class AddRealnameToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :realname, :string
  end
end
