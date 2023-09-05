json.extract! message, :id, :chat_interfaces_id, :content, :type, :created_at, :updated_at
json.url message_url(message, format: :json)
