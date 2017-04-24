class Booking < ApplicationRecord
  validates :people, :numericality => { :only_integer => true, :greater_than => 0, :less_than => 100 }
  validate :restaurant_must_be_within_capacity
  has_and_belongs_to_many :restaurants
  belongs_to :user

  def restaurant_must_be_within_capacity
    unless self.restaurant.is_available?(self.begin_time, self.people) #checks time and number of people against available capacity.
      errors.add(:begin_time, "is not available.")
    end
  end
end
