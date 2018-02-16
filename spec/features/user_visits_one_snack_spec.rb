require "rails_helper"

describe "user visits snack show page" do
  it "displays snack name & price" do
    snack = Snack.create(name: "cheetos", price: 150)

    visit snack_path(snack)

    expect(page).to have_content(snack.name)
    expect(page).to have_content(snack.price)
  end
  it "displays snack machine locations" do
    owner = Owner.create(name: "dude")
    snack = Snack.create(name: "cheetos", price: 150)
    machine_1 = snack.machines.create(location: "house", owner_id: owner.id)
    machine_2 = snack.machines.create(location: "store", owner_id: owner.id)

    visit snack_path(snack)

    expect(page).to have_content(machine_1.location)
    expect(page).to have_content(machine_2.location)
    expect(page).to have_content(machine_1.avg_price)
    expect(page).to have_content(machine_2.avg_price)
    expect(page).to have_content(machine_1.snacks.count)
    expect(page).to have_content(machine_2.snacks.count)
  end
end
