class Dice::Bag
  attr_reader :result, :dice

  def initialize(dice)
    @dice = dice
    @result = 0
  end

  def roll
    @result = 0

    @dice.each do |die|
      @result += die.roll
    end

    @result
  end
end
