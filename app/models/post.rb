class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :asset, presence: true, numericality: { only_integer: true }, unless: :was_attached?
  validates :text, presence: true

  def was_attached?
    self.image.attached?
  end
end
