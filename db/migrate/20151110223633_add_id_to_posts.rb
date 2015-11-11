class AddIdToPosts < ActiveRecord::Migration
  def change
    # what is the point of this column?
    add_column :posts, :post_id, :integer
  end
end
