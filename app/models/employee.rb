class Employee < ApplicationRecord

    has_many :appointments

    validates :username, presence: true, uniqueness: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    has_secure_password
end


