include ChatMacros

feature "用户聊天" do 

  # before :each do 
  #   @tom = create :user, name: "Tom"
  #   @jerry = create :user, name: "Jerry"
  # end

  given(:team) { create :chat_team }

  scenario "发聊天信息并接受到反馈" do
    choose_chat_team(team)
    send_chat_message("hello world")
  end
  
end