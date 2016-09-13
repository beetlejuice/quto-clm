class LoginScreen < GenericScreen
  text_field('login_field', :xpath => "//UIAApplication[1]/UIAWindow[1]/UIAScrollView[1]/UIAWebView[1]/UIAStaticText[@label='Username']/following-sibling::UIATextField[1]")
  text_field('password_field', :xpath => "//UIAApplication[1]/UIAWindow[1]/UIAScrollView[1]/UIAWebView[1]/UIAStaticText[@label='Password']/following-sibling::UIASecureTextField[1]")
  button('signin_button', :xpath => "//UIAApplication[1]/UIAWindow[1]/UIAScrollView[1]/UIAWebView[1]/UIAButton[@label='Sign In']")

  def active?
    login_field.displayed?
  end

  def perform_login_with(credentials)
    login = credentials[:login]
    password = credentials[:password]
    login_field.send_keys login.to_s
    # click_keyboard_button('Next input field')
    password_field.send_keys password.to_s
    # click_keyboard_button('Go')
    signin_button_click
  end
end