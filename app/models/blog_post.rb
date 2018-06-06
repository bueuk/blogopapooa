class BlogPost < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user

  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations


  validates :title, presence: true
  validates :description, presence: true, length: { maximum: 200 }
  validates :content, presence: true, length: { minimum: 30 }

  def sticky?
    sticky_order != 100
  end

  def pinit!
    self.sticky_order = 1
    self.save
  end

  def unpin!
    self.sticky_order = 100
    self.save
  end

  def published?
    published == 1
  end

end
