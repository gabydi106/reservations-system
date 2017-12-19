class Bed < ApplicationRecord
  belongs_to :reservation, optional: true

  def is_available
    where("available is TRUE")
  end

  def self.count_available
    where("available is TRUE").count
  end
end
