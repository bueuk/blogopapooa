class AddImageIdToBlogPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :blog_posts, :image_id, :integer
  end
end
