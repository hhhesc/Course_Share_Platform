class CreateArticleLike < ActiveRecord::Migration[7.1]
  def change
    create_table :article_likes do |t|
      t.references :like_user, null: false, foreign_key: {to_table: :users}
      t.references :like_article, null: false, foreign_key: {to_table: :articles}

      t.timestamps
    end
  end
end
