class CreateChatLogs < ActiveRecord::Migration
  def change
    create_table :chat_logs do |t|
      t.string :message

      t.timestamps
    end
  end
end
