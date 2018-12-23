json.extract! entry, :id, :name, :description, :longitude, :latitude, :created_at, :updated_at
json.url entry_url(entry, format: :json)
