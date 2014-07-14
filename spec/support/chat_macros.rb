module ChatMacros

  def choose_chat_team(chat_team)
    visit chat_teams_path
    within "ul.list-group" do 
      expect(page).to have_content chat_team.name
    end
    click_link chat_team.name
    expect(page).to have_content chat_team.name
  end

  def send_chat_message(message)
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

end