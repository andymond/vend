require "rails_helper"

describe "user visits snack show page" do
  it "displays snack name & price" do
    snack = Snack.create(name: "cheetos", price: 150)

    visit snack_path(snack)

    expect(page).to have_content(snack.name)
    expect(page).to have_content(snack.price)
  end
end
