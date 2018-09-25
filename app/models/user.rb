class User
  include Mongoid::Document
  include Mongoid::Timestamps

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  ## Database authenticatable
  field :email,              type: String, default: ''
  field :encrypted_password, type: String, default: ''

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  has_many :items
  has_many :loaned, class_name: 'Borrow', inverse_of: :lender
  has_many :borrowed, class_name: 'Borrow', inverse_of: :borrower

  index({ email: 1 }, { unique: true })

  validates :email, uniqueness: true

  def admin?
    self == User.first
  end

  def current_borrows
    self.borrowed.select { |b| !b.returned? }.map(&:item)
  end
end
