class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.string :author
      t.string :photo_url
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
