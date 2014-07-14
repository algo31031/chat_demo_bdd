class CreateUserChatTeams < ActiveRecord::Migration
  def change
    create_table :user_chat_teams do |t|
      t.integer :user_id
      t.integer :chat_team_id
      t.boolean :is_online
      t.boolean :has_new_messga
      t.string :faye_client_id

      t.timestamps
    end
  end
end
