class Bed < ApplicationRecord
  belongs_to :reservation, optional: true
  validates_presence_of :available
end
