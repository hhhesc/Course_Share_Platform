class CreateArticleTag < ActiveRecord::Migration[7.1]
  def change
    create_table :article_tags do |t|
      t.references :article, null: false, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
