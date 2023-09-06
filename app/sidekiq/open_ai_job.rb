# frozen_string_literal: true

class OpenAiJob
  include Sidekiq::Job

  def perform(chat_interface_id)
    @chat_interface = ChatInterface.find(chat_interface_id)
    call_openai(@chat_interface)
  end

  private

  def call_openai(chat_interface)
    message = chat_interface.messages.create(role: 'assistant', content: '')
    message.broadcast_created

    OpenAI::Client.new.chat(
      parameters: {
        model: 'gpt-3.5-turbo',
        messages: Message.for_openai(chat_interface.messages),
        temperature: 0.1,
        stream: stream_proc(message: message)
      }
    )
  end

  def stream_proc(message:)
    proc do |chunk, _bytesize|
      new_content = chunk.dig('choices', 0, 'delta', 'content')
      message.update(content: message.content + new_content) if new_content
    end
  end
end
