class AddPublishedToBlogPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :blog_posts, :published, :integer
  end
end
