class Dice::Die
  attr_reader :face

  def initialize(sides, explode: nil, seed: nil)
    @sides = sides
    @seed = seed
    @explode = explode
  end

  def roll
    @randomizer ||= ::Dice::Randomizer.for(@sides, @seed)
    @face = @randomizer.random
  end

  def to_s
    @face.to_s
  end
end
