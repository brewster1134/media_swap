# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create! email: 'ryan.brewster@akqa.com', password: "password1", password_confirmation: "password1"
user1.items.create! name: 'Book Foo', medium: 'book', platform: 'ebook'
user1.items.create! name: 'Game Foo', medium: 'game', platform: 'xbox'

user2 = User.create! email: 'ryan.brewster-2@akqa.com', password: "password2", password_confirmation: "password2"
user2.items.create! name: 'Book Bar', medium: 'book', platform: 'paper'
user2.items.create! name: 'Game Bar', medium: 'game', platform: 'ps4'

borrow1 = Borrow.create! lender: user1, borrower: user2, item: user1.items.first
borrow2 = Borrow.create! lender: user2, borrower: user1, item: user2.items.first
