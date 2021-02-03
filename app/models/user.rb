class User < ApplicationRecord
    has_many :appointments
    validates :email, presence: true, uniqueness: true
    has_secure_password
end
