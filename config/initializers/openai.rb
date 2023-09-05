OpenAI.configure do |config|
  debug
  config.access_token = ENV["open_ai_token"]
end