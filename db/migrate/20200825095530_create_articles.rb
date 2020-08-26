class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.text :body
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
