class User < ActiveRecord::Base

  has_many :chat_logs, dependent: :destroy
  has_many :user_chat_teams, dependent: :destroy
  has_many :chat_teams, through: :user_chat_teams

  validates :name, presence: true

end
