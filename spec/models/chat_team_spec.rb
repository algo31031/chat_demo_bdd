require 'rails_helper'

RSpec.describe ChatTeam, :type => :model do
  
  it "没有name就无法通过验证" do
    chat_team = build :chat_team, name: nil
    expect(chat_team).to have(1).error_on(:name)
  end

end
