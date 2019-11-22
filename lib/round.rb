require './lib/turn'

class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @correct_count = 0
    @num = 0
    @category_num = 0
    @category_sum = 0
    @category_correct = 0
  end

  def current_card
    #require "pry"; binding.pry
    deck.cards[@num]
    # if turns != []
    # @num += 1
    # current_card = deck.cards[@num]
    #end
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @num += 1
    if turn.correct? == true
      @correct_count += 1
    end
    turns << turn
    turn
      #require "pry"; binding.pry
  end

  def number_correct
    @correct_count
  end

  def number_correct_by_category(category)
    # @category_num = 0

    turns.find_all do |turn|
      if turn.card.category == category && turn.correct?
        @category_num += 1
      end
    end

    @category_num
  end

  def percent_correct
    (@correct_count.to_f/@num.to_f) * 100.0
    #require "pry"; binding.pry
  end

  def percent_correct_by_category(category)

    turns.find_all do |turn|
      if turn.card.category == category
        @category_sum += 1
      end
    end

    turns.find_all do |turn|
      if turn.card.category == category && turn.correct?
        @category_correct += 1
      end
    end

    (@category_correct.to_f / @category_sum.to_f) * 100.0
    #require "pry"; binding.pry
  end

end
