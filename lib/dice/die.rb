class Dice::Die
  def initialize(sides, explode: nil, seed: nil)
    @sides = sides
    @seed = seed
    @explode = explode
  end

  def roll
    srand(@seed) if @seed
    rand(@sides - 1) + 1
  end

  def to_s
  end
end
