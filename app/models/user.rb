class User < ApplicationRecord
    has_secure_password
    validates :email, uniqueness: true
    has_many :stories
    #presence: true, {case_sensitive: false}
end
