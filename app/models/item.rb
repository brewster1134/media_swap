require 'action_view'
include ActionView::Helpers::DateHelper

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

  # checks if item was never borrowed, or has been returned
  def available?
    borrows.count == 0 || borrows.all? { |borrow| borrow.returned? }
  end

  def current_borrow
    borrows.last unless available?
  end

  def self.available
    Item.all.select { |item| item.available? }
  end
end
