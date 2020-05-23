RSpec.describe Dice do
  it "has a version number" do
    expect(Dice::VERSION).not_to be nil
  end
end

RSpec.describe Dice::Die do
  context "rolling a d6" do
    let(:die_roll) { Dice::Die.new(6).roll }

    it "rolls less than 6" do
      expect(die_roll).to be <= 6
    end

    it "rolls higher than 0" do
      expect(die_roll).to be > 0
    end
  end

  context "rolling a d20" do
    let(:die_roll) { Dice::Die.new(20).roll }

    it "rolls less than 20" do
      expect(die_roll).to be <= 20
    end

    it "rolls higher than 0" do
      expect(die_roll).to be > 0
    end
  end
end
