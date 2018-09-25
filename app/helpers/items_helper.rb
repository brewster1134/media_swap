module ItemsHelper
  MEDIUMS = [:book, :game, :movie]
  PLATFORMS = {
    book: [:ebook, :paper],
    game: [:ps4, :xbox, :switch, :pc],
    movie: [:dvd, :bluray],
  }

  def self.mediums; MEDIUMS; end
  def self.platforms; PLATFORMS; end
end
