class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :asset, presence: true, numericality: { only_integer: true }
  validates :text, presence: true
end
