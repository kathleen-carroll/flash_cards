class Card
  attr_reader :question, :answer, :category

  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end
end

#class Turn
# attr_accessor :string, :card

#  def initialize(string, card)
#    @string = string
#    @card = Card
#  end

#  def guess
#    @string
#  end

#end
