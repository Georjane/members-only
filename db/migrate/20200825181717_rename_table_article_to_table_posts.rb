class RenameTableArticleToTablePosts < ActiveRecord::Migration[6.0]
  def change
    rename_table :articles, :posts
  end
end
