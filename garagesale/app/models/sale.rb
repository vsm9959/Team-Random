class Sale < ActiveRecord::Base
  has_many :products
    belongs_to :user, inverse_of: :sales, foreign_key: "user_auth_token"
    has_attached_file :image, styles: {medium: "30x30>"}, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  
  def get_lat_lng()
    @sale_address = address_line1 + " " + address_line2 + " " + city + " " + state 
    @geocode = Geokit::Geocoders::GoogleGeocoder.geocode(@sale_address)
    @latlng = @geocode.ll
    @lat, @lng = @latlng.split(",")

    return [@lat, @lng]
  end
end
