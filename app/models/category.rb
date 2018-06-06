class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :categorizations, dependent: :destroy
  has_many :blog_posts, through: :categorizations

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
