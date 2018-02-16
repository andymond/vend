require "rails_helper"

describe Snack do
  context "Validations" do
    it "must have name & price to be valid" do
      snack = Snack.create(name: "payday", price: 100)

      expect(snack).to be_valid
    end
  end
end
