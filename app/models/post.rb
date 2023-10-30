class Post < ApplicationRecord
  belongs_to :user

  validates :asset, presence: true, numericality: { only_integer: true }
  validates :text, presence: true
end
