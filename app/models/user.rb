class User < ApplicationRecord
   has_secure_password
   validates :description, :name, :menu, :address, presence: true
end
