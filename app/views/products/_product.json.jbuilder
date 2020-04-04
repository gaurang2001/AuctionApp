json.extract! product, :id, :pid, :name, :desc, :startbid, :deadline, :contact, :created_at, :updated_at
json.url product_url(product, format: :json)
