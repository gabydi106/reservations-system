class Reservation < ApplicationRecord
  belongs_to :guest
  has_many :beds

  validates_presence_of :checkin

  def beds_assigned
    beds.ids
  end

  def self.checkin_today
    where(:checkin => Time.now)
  end

  def self.checkout_today
    where(:checkout => Time.now)
  end

  def self.upcoming
    where("checkin > ?", Date.today)
  end
end
