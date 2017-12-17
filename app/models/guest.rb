class Guest < ApplicationRecord
  has_many :reservations

  validates_presence_of :name

  accepts_nested_attributes_for :reservations
end
