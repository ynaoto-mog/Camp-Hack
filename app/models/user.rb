class User < ApplicationRecord
    validates :nickname, presence: true
    validates :username, presence: true, uniqueness: true, length: { minimum: 6 }
    validates :password, presence: true, uniqueness: true, length: { minimum: 6 }
    has_many :insects
    has_many :comments
end
