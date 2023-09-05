class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.references :chat_interfaces, null: false, foreign_key: true
      t.string :content
      t.integer :type

      t.timestamps
    end
  end
end
