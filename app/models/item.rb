class Item
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :medium, type: String
  field :platform, type: String
  field :description, type: String

  belongs_to :user
  has_many :borrows

  index({ name: 1 })

  validates :name, presence: true
  validates :medium, presence: true, inclusion: { in: %w(book game movie), message: "%{value} is not a valid medium" }
  validates :platform, presence: true, inclusion: { in: %w(ebook paper ps4 xbox switch pc dvd bluray), message: "%{value} is not a platform type" }
end
