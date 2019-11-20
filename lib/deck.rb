class Deck
  attr_reader :card, :cards
  
  def initialize(card)
    @card = card
    @cards = []
  end
end
