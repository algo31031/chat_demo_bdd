class ChatTeam < ActiveRecord::Base

  belongs_to :user
  has_many :chat_logs  

  validates :name, presence: true

end
