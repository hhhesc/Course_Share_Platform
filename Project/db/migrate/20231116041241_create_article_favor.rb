class CreateArticleFavor < ActiveRecord::Migration[7.1]
  def change
    create_table :article_favors do |t|
      t.references :favor_user, null: false, foreign_key: {to_table: :users}
      t.references :favor_article, null: false, foreign_key: {to_table: :articles}

      t.timestamps
    end
  end
end
