module Dice::Totaller
  def self.for(
    values,
    drop_lowest: 0,
    drop_highest: 0,
    keep_lowest: 0,
    keep_highest: 0
  )
    if (drop_lowest)
      DropLowest.new(values, drop_lowest)
    else
      Normal.new(dice)
    end
  end

  class Normal
    def initialize(values)
      @values = values
    end

    def total
      @values.sum
    end
  end

  class DropLowest
    def initialize(values, lowest)
      @values = values
      @lowest = lowest
    end

    def total
      @values.sort.drop(@lowest).sum
    end
  end

end
