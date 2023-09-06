# frozen_string_literal: true

class ChatInterface < ApplicationRecord
  include ActionView::RecordIdentifier

  belongs_to :user
  has_many :messages, dependent: :destroy

  after_update_commit -> { update_name }

  def update_name
    broadcast_replace_to("chat_interface_#{dom_id(self)}",
                         partial: 'chat_interfaces/chat_interface',
                         locals: { chat_interface: self },
                         target: "chat_interface_#{dom_id(self)}")
  end
end
