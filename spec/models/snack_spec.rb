require "rails_helper"

describe Snack do
  context "Validations" do
    it "must have name & price to be valid" do
      snack = Snack.create(name: "payday", price: 100)

      expect(snack).to be_valid
    end
  end
  context "Relationships" do
    it "has many machine_snacks" do
      owner = Owner.create(name: "max")
      machine_1 = owner.machines.create(location: "basement")
      machine_2 = owner.machines.create(location: "2nd floor")
      snack = Snack.create(name: "snickers", price: 80)
      machine_snack_1 = snack.machine_snacks.create(machine_id: machine_1.id)
      machine_snack_2 = snack.machine_snacks.create(machine_id: machine_2.id)

      expect(machine_snack_1).to be_valid
      expect(machine_snack_2).to be_valid
    end
  end
end
