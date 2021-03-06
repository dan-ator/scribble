class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author
      t.string :title
      t.string :body
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :comment_id
      t.references :post, index: true, foreign_key: true
    end
  end
end
