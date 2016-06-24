class User < ActiveRecord::Base
    has_secure_password
    has_many :sales, dependent: :destroy, inverse_of: :user
end
