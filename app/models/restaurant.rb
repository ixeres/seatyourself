class Restaurant < ApplicationRecord
  validates :description, :name, :menu, :address, presence: true
  validates :guests, numericality: { is: 100 }
end
