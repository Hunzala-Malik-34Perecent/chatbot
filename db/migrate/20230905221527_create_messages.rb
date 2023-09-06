# frozen_string_literal: true

class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.references :chat_interface, null: false, foreign_key: true
      t.string :content, null: false
      t.integer :role, null: false, defualt: 0

      t.timestamps
    end
  end
end
