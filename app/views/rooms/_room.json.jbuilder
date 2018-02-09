json.extract! room, :id, :location_address, :max_capacity, :type, :description, :building_id, :created_at, :updated_at
json.url room_url(room, format: :json)
