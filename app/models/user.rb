class User < ActiveRecord::Base

  has_many :chat_logs
  has_many :chat_teams

  validates :name, presence: true

end
