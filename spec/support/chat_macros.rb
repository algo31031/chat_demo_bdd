module ChatMacros

  def could_choose_chat_team(chat_team)
    visit chat_teams_path
    within "ul.list-group" do 
      expect(page).to have_content chat_team.name
    end
    click_link chat_team.name
    expect(page).to have_content chat_team.name
  end

  def could_send_chat_message(message)
    fill_in "chat_log_message", with: message
    click_button "发言"
    expect(page).to have_content(message)
  end

  def could_see_chat_team_list(*chat_teams)
    within("h3") do
      expect(page).to have_content("聊天组列表")
    end
    chat_teams.each do |team|
      within("li.list-group-item") do
        expect(page).to have_content(team.name)
      end
    end
  end

  def could_create_chat_team(owner, *members)
    click_link("创建聊天组")
    expect(page).to have_content("新建聊天组")
    within(".members") do
      expect(page).to have_content owner.name
      members.each do |member|
        expect(page).to have_content member.name
      end
    end
    fill_in "chat_team_name", with: "my_team"
    members.each do |member|
      check member.name
    end
    expect {
      click_button "提交"
    }.to change(ChatTeam, :count).by(1)
    visit chat_teams_path
    within("ul.list-group") do
      expect(page).to have_content("my_team")
    end
  end

  def create_chat_team(name)
    create :user, name: "Tom"    
    create :user, name: "Jerry"

    click_link("创建聊天组")
    fill_in "chat_team_name", with: name
    check "Tom"
    check "Jerry"      
    click_button "提交"
  end

end