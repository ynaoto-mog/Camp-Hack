class User < ApplicationRecord
    validates :nick_name, presence: true
    validates :login_id, presence: true, uniqueness: true, length: { minimum: 6 }
    validates :password, presence: true, uniqueness: true, length: { minimum: 6 }
end
