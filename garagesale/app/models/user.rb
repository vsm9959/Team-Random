class User < ActiveRecord::Base
    has_secure_password
    validates_presence_of :password, :on => :create
    validates :email,:presence => true, :uniqueness => {:message => "You already forgot you signed up, just login a hamster is smarter than you hahahahaha"}
    has_many :sales, dependent: :destroy, inverse_of: :user
    before_create { generate_token(:auth_token) }
def send_password_reset_email
  generate_token(:password_reset_token)
  save!
  UserMailer.password_reset(self).deliver
end
def generate_token(column)
    begin
    self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
end
end
