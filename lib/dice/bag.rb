class Dice::Bag
  attr_reader :results, :dice

  def initialize(
    dice, 
    drop_lowest: 0, 
    drop_highest: 0,
    keep_lowest: 0,
    keep_highest: 0
  )
    @dice = dice
    @results = []
    @options = {
      drop_lowest: drop_lowest,
      drop_highest: drop_highest,
      keep_lowest: keep_lowest,
      keep_highest: keep_highest
    }
  end

  def roll
    @results = []

    @dice.each do |die|
      @results.push(die.roll)
    end

    Dice::Totaller.for(@results, **@options).total
  end
end
