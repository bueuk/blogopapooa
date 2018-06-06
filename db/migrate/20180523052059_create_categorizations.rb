class CreateCategorizations < ActiveRecord::Migration[5.1]
  def change
    create_table :categorizations do |t|
      t.integer :blog_post_id
      t.integer :category_id

      t.timestamps
    end
  end
end
