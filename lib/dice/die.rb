class Dice::Die
  attr_reader :face

  def initialize(sides, reroll: nil, explode: nil, seed: nil)
    @sides = sides
    @seed = seed
    @explode = explode
    @reroll = Array(reroll)
  end

  def roll
    @randomizer ||= ::Dice::Randomizer.for(@sides, @seed)
    @face = @randomizer.random

    while @reroll.include? @face do
      @face = @randomizer.random
    end

    @face
  end

  def to_s
    @face.to_s
  end
end
