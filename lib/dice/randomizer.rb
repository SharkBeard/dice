module Dice::Randomizer
  def self.for(max, seed = nil)
    seed ? Seeded.new(max, seed) : Normal.new(max)
  end

  def self.random(max, seed = nil)
    self.for(max, seed).random
  end

  class Normal
    def initialize(max)
      @max = max
    end

    def random
      rand(@max - 1) + 1
    end
  end

  class Seeded
    def initialize(max, seed)
      @max = max
      @seed = seed
    end

    def random
      srand(@seed)
      rand(@max - 1) + 1
    end
  end
end
