# frozen_string_literal: true

class CreateChatInterfaces < ActiveRecord::Migration[7.0]
  def change
    create_table :chat_interfaces do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
