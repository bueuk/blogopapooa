class Categorization < ApplicationRecord
  belongs_to :blog_post
  belongs_to :category, counter_cache: :blog_post_count
end
