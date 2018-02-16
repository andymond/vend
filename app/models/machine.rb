class Machine < ApplicationRecord
  belongs_to :owner
  has_many :machine_snacks
end
