json.array!(@items) do |item|
  json.extract! item, :id, :title, :description, :link, :category
  json.url item_url(item, format: :json)
end
