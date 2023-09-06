# frozen_string_literal: true

class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.references :chat_interface, null: false, foreign_key: true
      t.string :content
      t.integer :user_type

      t.timestamps
    end
  end
end
