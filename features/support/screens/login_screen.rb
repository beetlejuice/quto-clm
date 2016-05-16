require 'quto'

class LoginScreen
  include Quto

  text_field('login_field', :xpath => "//UIAApplication[1]/UIAWindow[1]/UIAScrollView[1]/UIAWebView[1]/UIAStaticText[@label='Username']/following-sibling::UIATextField[1]")
  text_field('password_field', :xpath => "//UIAApplication[1]/UIAWindow[1]/UIAScrollView[1]/UIAWebView[1]/UIAStaticText[@label='Password']/following-sibling::UIASecureTextField[1]')")

  def active?
  end

  def perform_login_with(credentials)
    username = credentials[:username]
    password = credentials[:password]
    login_field_view.send_keys username.to_s
    click_keyboard_button('Next input field')
    password_field_view.send_keys password.to_s
    click_keyboard_button('Go')
  end
end