class CreateBlogPosts < ActiveRecord::Migration[5.1]
  def up
    create_table :blog_posts do |t|
      t.string :title
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end

  def down
    drop_table :blog_posts
  end
end
