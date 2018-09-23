class Borrow
  include Mongoid::Document
  include Mongoid::Timestamps

  field :returned_at, type: Time

  belongs_to :item
  belongs_to :lender, class_name: 'User', inverse_of: :loaned
  belongs_to :borrower, class_name: 'User', inverse_of: :borrowed

  index({ item: 1 })
  index({ lender: 1 })
  index({ borrower: 1 })

  validates :item, uniqueness: true
  validates :lender, uniqueness: true
  validates :borrower, uniqueness: true
  validate :minimum, on: :create
  def minimum
    if borrower.items.where(medium: item.medium).count < 1
      errors.add "You have to list a #{item.medium} before borrowing one"
    end
  end
end
