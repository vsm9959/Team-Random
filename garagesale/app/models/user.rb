class User < ActiveRecord::Base
    has_secure_password
    has_many :sales, inverse_of: :user
end
