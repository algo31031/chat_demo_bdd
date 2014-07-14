class UserChatTeam < ActiveRecord::Base

  belongs_to :user
  belongs_to :chat_team

end
