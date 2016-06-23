json.array!(@sales) do |sale|
  json.extract! sale, :id, :title, :description, :address_line1, :address_line2, :city, :state, :posted_date, :zip_code
  json.url sale_url(sale, format: :json)
end
