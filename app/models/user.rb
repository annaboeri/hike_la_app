class User < ApplicationRecord
    has_many :hikes
    has_many :reviews
    has_secure_password
end
