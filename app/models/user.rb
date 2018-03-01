class User < ApplicationRecord
    has_many :hikes
    has_many :reviews
    has_secure_password
    validates :name, presence: true
    validates :email, presence: true
    validates :email, uniqueness: true
    validates :password, length: { in: 6..20 }


end
