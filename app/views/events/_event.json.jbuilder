json.extract! event, :id, :name, :number_attending, :description, :group_tag, :room_id, :user_id, :organization_id, :created_at, :updated_at
json.url event_url(event, format: :json)
