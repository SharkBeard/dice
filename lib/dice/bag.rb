class Dice::Bag
  attr_reader :result, :dice

  def initialize(dice, drop_lowest: 0)
    @dice = dice
    @results = []
    @drop_lowest = drop_lowest
  end

  def roll
    @results = []

    @dice.each do |die|
      @results.push(die.roll)
    end

    Dice::Totaller.for(
      @results,
      drop_lowest: @drop_lowest
    ).total
  end
end
