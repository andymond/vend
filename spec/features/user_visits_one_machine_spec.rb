require "rails_helper"

feature "user visits show page for one vending maching" do
  scenario "they see a list of the vending machines snacks & their prices" do
    owner = Owner.create(name: "max")
    machine = owner.machines.create(location: "basement")
    snack_1 = machine.snacks.create(name: "kitkat", price: 100)
    snack_2 = machine.snacks.create(name: "twix", price: 75)

    visit machine_path(machine)

    expect(page).to have_content(snack_1.name)
    expect(page).to have_content(snack_1.price)
    expect(page).to have_content(snack_2.name)
    expect(page).to have_content(snack_2.price)
  end
end
