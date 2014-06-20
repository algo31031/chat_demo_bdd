class AddChatTeamIdAndUserIdToChatLogs < ActiveRecord::Migration
  def change
    add_column :chat_logs, :chat_team_id, :integer
    add_column :chat_logs, :user_id, :integer
  end
end
