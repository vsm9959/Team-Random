class Sale < ActiveRecord::Base
    belongs_to :user, inverse_of: :sales, foreign_key: "user_auth_token"
    has_attached_file :image, styles: {medium: "30x30>"}, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
    
end
