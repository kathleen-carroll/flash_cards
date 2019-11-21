class Deck
  attr_reader :deck, :cards

  def initialize(cards)
    @cards = cards
    #@deck = []
  end

  # def add_card(cards)
  #   @deck << cards
  # end

  def count
    @deck.count
  end

  def cards_in_category(category)
    @cards.find_all do |card|
      #require "pry"; binding.pry
       category == card.category
    end
  end
end

# cards = [@card1, @card2, @card3]
# deck = Deck.new(@cards)
# p deck.cards_in_category(:STEM)
