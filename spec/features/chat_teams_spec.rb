include UserMacros
include ChatMacros

feature "聊天组的功能" do

  let!(:team) { create :chat_team }

  background do
    visit chat_teams_path
  end

  context '访客' do

    scenario "可以浏览聊天组列表" do
      could_see_chat_team_list(team)
    end

    scenario "无法加入聊天组" do
      click_link team.name
      expect(page).to have_content("请先登录") 
    end    

    scenario "无法创建聊天组" do
      expect(page).not_to have_content("创建聊天组")
      visit new_chat_team_path
      expect(page).to have_content("请先登录") 
    end

    scenario "无法编辑聊天组" do
      expect(page).not_to have_content("编辑")
      visit edit_chat_team_path(team)
      expect(page).to have_content("请先登录")           
    end    
    
  end
  
  context "普通用户" do

    let!(:user) { create :user }

    before(:each) do
      login user
    end

    scenario "可以浏览聊天组列表" do
      could_see_chat_team_list(team)
    end

    scenario "可以加入聊天组" do
      choose_chat_team(team)
    end

    scenario "可以创建聊天组" do
      create :user, name: "Tom"    
      create :user, name: "Jerry"

      click_link("创建聊天组")
      expect(page).to have_content("新建聊天组")
      within(".members") do
        expect(page).to have_content user.name
        expect(page).to have_content "Tom"
        expect(page).to have_content "Jerry"
      end
      fill_in "chat_team_name", with: "my team"
      check "Tom"
      check "Jerry"
      expect {
        click_button "提交"
      }.to change(ChatTeam, :count).by(1)
      visit chat_teams_path
      within("ul.list-group") do
        expect(page).to have_content("my team")
      end
    end

    scenario "只可以编辑自己创建的聊天组" do
      create :user, name: "Tom"    
      create :user, name: "Jerry"

      click_link("创建聊天组")
      fill_in "chat_team_name", with: "this team"
      check "Tom"
      check "Jerry"      
      click_button "提交"
      within("ul.list-group") do
        expect(page).to have_content("编辑")
      end
      click_link "编辑"
      fill_in "chat_team_name", with: "that team"
      click_button "提交"
      within("ul.list-group") do
        expect(page).to have_content("that team")
      end
      logout
      another_user = create :user
      login another_user
      within("ul.list-group") do
        expect(page).to have_content("that team")
        expect(page).not_to have_content("编辑")
      end 
    end

  end

  context "管理员" do 

    let!(:admin) { create :admin }

    before(:each) do
      login admin
    end    

    scenario "可以浏览聊天组列表" do
      could_see_chat_team_list(team)
    end

    scenario "可以加入聊天组" do 

    end

    scenario "可以创建聊天组" do 

    end

    scenario "可以删除聊天组" do
      
    end

    scenario "可以编辑聊天组" do
      
    end

  end

end