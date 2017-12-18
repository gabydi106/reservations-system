class Bed < ApplicationRecord
  belongs_to :reservation, optional: true
end
