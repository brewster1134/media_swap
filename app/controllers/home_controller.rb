class HomeController < ApplicationController
  @@mediums = [:book, :game, :movie]
  @@platforms = {
    book: [:ebook, :paper],
    game: [:ps4, :xbox, :switch, :pc],
    movie: [:dvd, :bluray],
  }

  def index
    skip_authorization

    @available_items = Item.available.select { |item| item.user != current_user }
    if current_user
      @borrowed_items = current_user.current_borrows
      @user_items = current_user.items
    end
  end
end
