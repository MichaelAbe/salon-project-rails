class User < ApplicationRecord

    validates :email, presence: true, uniquness: true
    has_secure_password
end
