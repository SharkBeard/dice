module Dice::Totaller
  def self.for(
    values,
    drop_lowest: 0,
    drop_highest: 0,
    keep_lowest: 0,
    keep_highest: 0
  )
    if (drop_lowest > 0)
      DropLowest.new(values, drop_lowest)
    elsif (drop_highest > 0)
      DropHighest.new(values, drop_highest)
    elsif (keep_lowest > 0)
      KeepLowest.new(values, keep_lowest)
    elsif (keep_highest > 0)
      KeepHighest.new(values, keep_highest)
    else
      Normal.new(values)
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

  class KeepLowest
    def initialize(values, lowest)
      @values = values
      @lowest = lowest
    end

    def total
      @values.sort.take(@lowest).sum
    end
  end

  class DropHighest
    def initialize(values, highest)
      @values = values
      @highest = highest
    end

    def total
      @values.sort.reverse.drop(@highest).sum
    end
  end

  class KeepHighest
    def initialize(values, highest)
      @values = values
      @highest = highest
    end

    def total
      @values.sort.reverse.take(@highest).sum
    end
  end
end
