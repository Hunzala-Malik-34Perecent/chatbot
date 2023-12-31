# frozen_string_literal: true

class Message < ApplicationRecord
  include ActionView::RecordIdentifier

  belongs_to :chat_interface

  enum role: { system: 0, assistant: 10, user: 20 }

  after_create_commit -> { broadcast_created }
  after_update_commit -> { broadcast_updated }

  def broadcast_created
    broadcast_append_later_to(
      "#{dom_id(chat_interface)}_messages",
      partial: 'messages/message',
      locals: { message: self, scroll_to: true },
      target: "#{dom_id(chat_interface)}_messages"
    )

    return unless chat_interface.name.blank?

    chat_interface.update!(name: content)
  end

  def broadcast_updated
    broadcast_append_to(
      "#{dom_id(chat_interface)}_messages",
      partial: 'messages/message',
      locals: { message: self, scroll_to: true },
      target: "#{dom_id(chat_interface)}_messages"
    )
  end

  def self.for_openai(messages)
    messages.map { |message| { role: message.role, content: message.content } }
  end
end
