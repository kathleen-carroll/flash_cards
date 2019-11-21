require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  def setup
    @card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
  end

  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_if_cards_works
    #@card1.add_card
    assert_equal @cards, @deck.cards
  end

  def test_the_card_count
    assert_equal @cards.count, @deck.cards.count
  end

  def test_cards_in_category_stem
    assert_equal [@card2, @card3], @deck.cards_in_category(:STEM)
  end

  def test_cards_in_category_geo
    assert_equal [@card1], @deck.cards_in_category(:Geography)
  end

  def test_cards_in_category_geo
    assert_equal [], @deck.cards_in_category("Pop Culture")
  end
end
