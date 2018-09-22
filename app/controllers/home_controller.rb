class HomeController < ApplicationController
  @@mediums = [:book, :game, :movie]
  @@platforms = {
    book: [:ebook, :paper],
    game: [:ps4, :xbox, :switch, :pc],
    movie: [:dvd, :bluray],
  }

  def index
    @my_items = Item.where user_id: current_user
    # @available_items = Item.where
  end
end
