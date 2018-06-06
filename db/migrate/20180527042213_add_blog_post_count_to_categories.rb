class AddBlogPostCountToCategories < ActiveRecord::Migration[5.1]
  def up
    add_column :categories, :blog_post_count, :integer
    
    Category.all.each do |c|
      Category.reset_counters(c.id, :blog_posts)
    end
  end

  def down
    remove_column :categories
  end
end
