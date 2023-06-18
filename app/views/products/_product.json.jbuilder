json.extract! product, :id, :name, :purchase_price, :tax_rate, :bin_code, :description, :discount, :selling_price, :created_at, :updated_at
json.url product_url(product, format: :json)
