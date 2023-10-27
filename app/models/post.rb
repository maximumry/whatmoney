class Post < ApplicationRecord
  belongs_to :user

  validates :asset, presence: true
  validates :text, presence: true
end
