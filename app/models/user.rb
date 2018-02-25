class User < ApplicationRecord
    has_many :hikes
    has_secure_password
end
