module UserMacros

  def set_user_session(user)
    session[:user_id] = user.id
  end

  def login(user_name)
    fill_in "user_name", with: user_name
    click_button("登录")
  end

  def logout
    click_link("登出")
  end

end