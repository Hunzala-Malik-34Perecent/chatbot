# frozen_string_literal: true

class OpenAiJob
  include Sidekiq::Job

  def perform(chat_interface_id)
    @chat_interface = ChatInterface.find(chat_interface_id)
    call_openai(@chat_interface)
  end

  private

  def call_openai(chat_interface)
    @response = OpenAI::Client.new.chat(
      parameters: {
        model: 'gpt-3.5-turbo',
        messages: Message.for_openai(chat_interface.messages),
        temperature: 0.1
      }
    )
    debugger
    Message.create!(chat_interface_id: chat_interface.id, user_type: 'chatbot',
                    content: @response.dig('choices', 0, 'message', 'content'))
  end
end
