include UserMacros
include ChatMacros

feature "聊天组的功能" do

  let!(:team) { create :chat_team }

  background do
    visit chat_teams_path
  end

  context '作为访客' do

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
  
  context "作为普通用户" do

    let!(:user) { create :user }

    before(:each) do
      login user.name
    end

    scenario "可以浏览聊天组列表" do
      could_see_chat_team_list(team)
    end

    scenario "可以加入聊天组" do
      could_choose_chat_team(team)
    end

    scenario "可以创建聊天组" do
      tom   = create :user, name: "Tom"    
      jerry = create :user, name: "Jerry"
      could_create_chat_team(user, tom, jerry)
    end

    scenario "只可以编辑自己创建的聊天组" do
      within("ul.list-group") do
        expect(page).not_to have_content("编辑")
      end      
      create_chat_team("this_team")    
      within("ul.list-group") do
        expect(page).to have_content("编辑")
      end
      click_link "编辑"
      fill_in "chat_team_name", with: "updated team"
      click_button "提交"
      within("ul.list-group") do
        expect(page).to have_content("updated team")
      end
      logout
      another_user = create :user
      login another_user.name
      within("ul.list-group") do
        expect(page).to have_content("updated team")
        expect(page).not_to have_content("编辑")
      end 
    end

  end

  context "作为管理员" do 

    let!(:admin) { create :admin }

    before(:each) do
      login admin.name
    end    

    scenario "可以浏览聊天组列表" do
      could_see_chat_team_list(team)
    end

    scenario "可以加入聊天组" do 
      could_choose_chat_team(team)
    end

    scenario "可以创建聊天组" do 
      tom   = create :user, name: "Tom"    
      jerry = create :user, name: "Jerry"
      could_create_chat_team(admin, tom, jerry)
    end

    scenario "可以编辑聊天组" do
      within("ul.list-group") do
        expect(page).to have_content("编辑")
      end
      click_link "编辑"
      fill_in "chat_team_name", with: "updated team"
      click_button "提交"
      within("ul.list-group") do
        expect(page).to have_content("updated team")
      end
    end

  end

end