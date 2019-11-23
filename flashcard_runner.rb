require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

@card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
@card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
@card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
@cards = [@card1, @card2, @card3]
@deck = Deck.new(@cards)
@round = Round.new(@deck)
@category = []
@percent_category = []

puts "Welcome! You are playing with #{@cards.count} cards."
puts "----------------------------------------------------"
#puts "You are on card #{@round.num + 1} out of #{@cards.count}"

#p @round.deck.cards[0]
#require "pry"; binding.pry
#p @round.deck.cards #returns whole card

#p @round.turns returns blank array

def start #use until loop until deck is empty
  #use @round.deck.cards to loop through
  until @round.num == @cards.count do
  puts "You are on card #{@round.num + 1} out of #{@cards.count}"
  puts "Question: #{@round.current_card.question}"
  puts "What's your guess?"
  guess = gets.chomp
  #require "pry"; binding.pry

  @turn = @round.take_turn(guess)
  @category << @turn.card.category
  @percent_category << @round.percent_correct_by_category(@category[@round.num - 1])

  puts @turn.feedback

  end

  #p @round.take_turn(guess).turn
  #p  @round.num
  puts "******** Game over! ********"
  puts "You had #{@round.number_correct} correct guesses out of #{@cards.count} for a total score of #{(@round.percent_correct).to_i}%."
#require "pry"; binding.pry
  @number = (1..@cards.count).to_a
  #@number.each do |number|
    #@number << (1..@cards.count).to_a
  # @cards.each do
  #p @cards.count
  puts @category[0]
  #puts @round.count
  # @round.turns.find_all do |turn|
  #   require "pry"; binding.pry
  #   puts @round.turns.category
  #   puts @round.percent_correct_by_category(@category[@round.num])
  #   puts @turn.card.category
  # end
  #puts @round.percent_correct_by_category(@turn.card.category)
  #puts (@turn.card.category)
  #puts @category

end

start

puts "******** Game over! ********"

puts "You had #{@round.number_correct} correct guesses out of #{@cards.count} for a total score of #{(@round.percent_correct).to_i}%."

@category.each do |category|
puts "#{category} - #{(@round.percent_correct_by_category(category)).to_i}% correct"
end

#require "pry"; binding.pry
#puts @round.percent_correct_by_category(@turn.card.category)
#puts (@turn.card.category)

#require "pry"; binding.pry

#p @round.current_card
