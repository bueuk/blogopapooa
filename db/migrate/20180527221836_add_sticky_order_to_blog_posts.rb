class AddStickyOrderToBlogPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :blog_posts, :sticky_order, :integer, default: 100
  end
end
