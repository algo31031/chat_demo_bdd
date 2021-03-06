include UserMacros
include ChatMacros

feature "用户聊天" do 

  background do
    visit chat_teams_path
  end  

  let!(:user) { create :user }

  before(:each) do
    login user
  end

  given(:team) { create :chat_team }

  scenario "发聊天信息并接受到反馈" do
    could_choose_chat_team(team)
    could_send_chat_message("hello world")
  end
  
end