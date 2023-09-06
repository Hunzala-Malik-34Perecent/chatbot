# frozen_string_literal: true

class Message < ApplicationRecord
  include ActionView::RecordIdentifier

  belongs_to :chat_interface

  enum user_type: { system: 0, chatbot: 10, user: 20 }

  after_create_commit -> { broadcast_created }

  def broadcast_created
    broadcast_append_later_to(
      "#{dom_id(chat_interface)}_messages",
      partial: 'messages/message',
      locals: { message: self, scroll_to: true },
      target: "#{dom_id(chat_interface)}_messages"
    )
  end

  def self.for_openai(messages)
    messages.map { |message| { user_type: message.user_type, content: message.content } }
  end
end
