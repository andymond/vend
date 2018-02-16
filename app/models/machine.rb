class Machine < ApplicationRecord
  belongs_to :owner
  has_many :machine_snacks
  has_many :snacks, through: :machine_snacks

  def avg_price
    snack_list = snacks.map do |snack|
      snack.price
    end
    snack_list.sum/snack_list.count
  end
end
