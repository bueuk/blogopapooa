class ChangeBlogPostCountDefaultInCategories < ActiveRecord::Migration[5.1]
  def change 
    change_column :categories, :blog_post_count, :integer, default: 0
  end
end
