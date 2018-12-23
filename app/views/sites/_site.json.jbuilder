json.extract! site, :id, :name, :description, :longitude, :latitude, :created_at, :updated_at
json.url site_url(site, format: :json)
