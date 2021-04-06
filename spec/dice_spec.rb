RSpec.describe Dice do
  it "has a version number" do
    expect(Dice::VERSION).not_to be nil
  end
end

RSpec.describe Dice::Die do
  context "rolling d6s" do
    let(:die) { Dice::Die.new(6) }
    let(:rolls) { Array.new(20) { die.roll } }
    let(:die_roll) { Dice::Die.new(6).roll }

    it "roll between 1-6" do
      expect(rolls).to all(be >= 1).and all(be <= 6)
      #expect(die_roll).to (be >= 1).and be <= 6
    end
  end

  context "rolling d20s" do
    let(:die) { Dice::Die.new(20) }
    let(:rolls) { Array.new(60) { die.roll } }

    it "roll between 1-20" do
      expect(rolls).to all(be >= 1).and all(be <= 20)
      # expect(die_roll).to (be >= 1).and be <= 20
    end
  end

  context "rolling d20s" do
    context "rerolling 1s" do
      let(:die) { Dice::Die.new(20, reroll: 1) }
      let(:rolls) { Array.new(60) { die.roll } }

      it "roll between 2-20" do
        expect(rolls).to all(be >= 2).and all(be <= 20)
      end
    end
  end
end

RSpec.describe Dice::Bag do
  context "rolling 2d6" do
    let(:dice) { Array.new(2) { Dice::Die.new(6) } }
    let(:bag) { Dice::Bag.new(dice) }
    let(:rolls) { Array.new(30) { bag.roll } }

    it "roll between 2-12" do
      expect(rolls).to all(be >= 2).and all(be <= 12)
    end
  end
end

  # TODO: Explode on x result
  # TODO: Success count
  # TODO: Take x top
  # TODO: Take x bottom
  # TODO: Zero index
  # TODO: Set faces
