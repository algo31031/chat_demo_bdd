class ChatTeam < ActiveRecord::Base

  belongs_to :owner, :foreign_key => :user_id, :class_name => "User"

  has_many :chat_logs, dependent: :destroy
  has_many :user_chat_teams, dependent: :destroy
  has_many :users, through: :user_chat_teams  

  validates :name, presence: true
  validates :users, presence: true

  before_create :add_owner

  def add_owner
    self.users << owner
  end

end
