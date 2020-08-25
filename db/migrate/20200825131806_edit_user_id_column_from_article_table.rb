class EditUserIdColumnFromArticleTable < ActiveRecord::Migration[6.0]
  def change
    rename_column :articles, :users_id, :user_id
  end
end
