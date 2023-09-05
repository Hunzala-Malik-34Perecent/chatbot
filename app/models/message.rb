class Message < ApplicationRecord
  belongs_to :chat_interfaces

  enum role: {chatbot: 0, user: 1}

  validates :content, present: true
end
