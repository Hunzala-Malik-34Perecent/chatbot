# frozen_string_literal: true

OpenAI.configure do |config|
  config.access_token = ENV['open_ai_token']
end
