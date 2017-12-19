class Reservation < ApplicationRecord
  belongs_to :guest
  has_many :beds

  validates_presence_of :checkin

  def beds_assigned
    beds.ids
  end
end
