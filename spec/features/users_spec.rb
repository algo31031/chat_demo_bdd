include UserMacros

feature "用户功能" do

  context "普通用户"  do

    scenario "注册新用户并登陆" do
      visit root_path
      expect {
        login("")
      }.not_to change(User, :count)
      expect(page).to have_content("Name can't be blank")
      expect {
        login("banban")
      }.to change(User, :count).by(1)
      within("li#user_name") do
        expect(page).to have_content("banban")
      end
    end

    scenario "已有用户登录" do
      jane = create :user, name: "Jane"
      visit root_path
      expect {
        login("Jane")
      }.not_to change(User, :count)
      within("li#user_name") do
        expect(page).to have_content("Jane")
      end    
    end

    scenario "用户登出" do
      tom = create :user, name: "Tom"
      visit root_path
      login "Tom"
      expect(page).to have_content("Tom")
      click_link "登出"
      expect(page).not_to have_content("Tom")
      expect(page).to have_button("登录")
    end
    
  end

end