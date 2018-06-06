class AddDescriptionToBlogPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :blog_posts, :description, :string
  end
end
