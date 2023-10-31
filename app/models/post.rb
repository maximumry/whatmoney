class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :image

  validates :asset, presence: true, numericality: { only_integer: true }
  validates :text, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end
