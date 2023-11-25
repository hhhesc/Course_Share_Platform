class AddPersonalSignToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :personal_sign, :string
  end
end
