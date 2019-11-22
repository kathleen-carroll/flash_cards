require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class DeckTest < Minitest::Test
  def setup
    @card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
    #require "pry"; binding.pry
  end

  def test_it_exists
    assert_instance_of Round, @round
  end

  def test_deck_is_correct
    assert_equal @deck, @round.deck
  end

  def test_turns_is_null_array
    assert_equal [], @round.turns
  end

  def test_current_card
    assert_equal @card1, @round.current_card #@round.deck.cards[0]
  end

  def test_new_turn_is_turn_class
    new_turn = @round.take_turn("Juneau")
    #require "pry"; binding.pry
    assert_instance_of Turn, new_turn #["Juneau"], @new_turn.turns #@deck.cards[0].answer
  end

  def test_new_turn_is_correct?
    new_turn = @round.take_turn("Juneau")

    assert_equal true, new_turn.correct?
  end

  def test_round_turns_has_cards
    new_turn = @round.take_turn("Juneau")
#require "pry"; binding.pry
    assert_equal [new_turn], @round.turns
  end

  def test_number_correct
    new_turn = @round.take_turn("Juneau")
    assert_equal 1, @round.number_correct

    @round.take_turn("saturn")
    assert_equal 1, @round.number_correct
  end

    def test_current_card_changes
     new_turn = @round.take_turn("Juneau")
 # #require "pry"; binding.pry
      assert_equal @card2, @round.current_card
    end

    def test_new_turn_on_new_card
      new_turn = @round.take_turn("Juneau")
      new_turn2 = @round.take_turn("Venus")

      assert_equal [new_turn, new_turn2], @round.turns
    end

    def test_count_of_rounds #@round.turns.count
      new_turn = @round.take_turn("Juneau")
      new_turn2 = @round.take_turn("Venus")

      assert_equal 2, @round.turns.count
    end

    def test_last_feedback
      new_turn = @round.take_turn("Juneau")
      new_turn2 = @round.take_turn("Venus")

      assert_equal "That's wrong!", @round.turns.last.feedback
    end

    def test_your_correct_count
      new_turn = @round.take_turn("Juneau")
      new_turn2 = @round.take_turn("Venus")

      assert_equal 1, @round.number_correct
    end

    def test_number_correct_by_category
      new_turn = @round.take_turn("Juneau")
      new_turn2 = @round.take_turn("Venus")

      assert_equal 1, @round.number_correct_by_category(:Geography)
    end
    #new_turn.card.category
    #new_turn.correct?
    #[new_turn, new_turn2].first.card.category
    #[new_turn, new_turn2].first.correct?
    #[new_turn, new_turn2][0].correct?
    def test_number_correct_by_category
      new_turn = @round.take_turn("Juneau")
      new_turn2 = @round.take_turn("Venus")

      assert_equal 0, @round.number_correct_by_category(:STEM)
    end

    def test_percent_correct_method
      new_turn = @round.take_turn("Juneau")
      new_turn2 = @round.take_turn("Venus")

      assert_equal 50.0, @round.percent_correct
    end

    def test_percent_correct_category_method
      new_turn = @round.take_turn("Juneau")
      new_turn2 = @round.take_turn("Venus")

      assert_equal 100.0, @round.percent_correct_by_category(:Geography)
    end

    def test_current_card_again
      new_turn = @round.take_turn("Juneau")
      new_turn2 = @round.take_turn("Venus")

      assert_equal @card3, @round.current_card
    end

end
