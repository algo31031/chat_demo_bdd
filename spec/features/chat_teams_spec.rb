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

    end

    scenario "可以创建聊天组" do 

    end

    scenario "只可以编辑自己创建的聊天组" do
      
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