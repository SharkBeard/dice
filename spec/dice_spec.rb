RSpec.describe Dice do
  it "has a version number" do
    expect(Dice::VERSION).not_to be nil
  end
end

RSpec.describe Dice::Die do
  context "rolling a d6" do
    let(:die_roll) { Dice::Die.new(6).roll }

    it "rolls between 1-6" do
      expect(die_roll).to (be >= 1).and be <= 6
    end
  end

  context "rolling a d20" do
    let(:die_roll) { Dice::Die.new(20).roll }

    it "rolls between 1-20" do
      expect(die_roll).to (be >= 1).and be <= 20
    end
  end

  # TODO: Reroll
  # TODO: Reroll on x result
  # TODO: Explode on x result
  # TODO: Success count
  # TODO: Zero index
  # TODO: Set faces
end
