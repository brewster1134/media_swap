class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :items
  has_many :loaned, class_name: 'Borrow', foreign_key: 'lender_id'
  has_many :borrowed, class_name: 'Borrow', foreign_key: 'borrower_id'

  validates :email, uniqueness: true
end
