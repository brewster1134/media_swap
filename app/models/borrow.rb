class Borrow < ApplicationRecord
  belongs_to :item
  belongs_to :lender, class_name: 'User'
  belongs_to :borrower, class_name: 'User'
end
