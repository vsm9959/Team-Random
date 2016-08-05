json.array!(@sale_products) do |sale_product|
  json.extract! sale_product, :id, :name, :price
  json.url sale_product_url(sale_product, format: :json)
end
