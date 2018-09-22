class Item < ApplicationRecord
  belongs_to :user
  has_many :borrows

  validates :name, presence: true
  validates :medium, presence: true, inclusion: { in: %w(book game movie), message: "%{value} is not a valid medium" }
  validates :platform, presence: true, inclusion: { in: %w(ebook paper ps4 xbox switch pc dvd bluray), message: "%{value} is not a platform type" }
end
