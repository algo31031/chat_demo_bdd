module ChatMacros

  def choose_chat_team(chat_team)
    visit chat_teams_path
    within "table" do 
      expect(page).to have_content chat_team.name
    end
    click_link "Show"
    expect(page).to have_content chat_team.name
  end

  def send_chat_message(message)
    fill_in "chat_log_message", with: message
    click_button "发言"
    expect(page).to have_content("hello world")
  end

end