class User < ApplicationRecord
    has_many :appointments
    has_many :employees, through: :appointments
    
    validates :email, presence: true, uniqueness: true
    has_secure_password
end
