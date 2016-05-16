require 'quto'

class AuthorizationRequestScreen
  include 'quto'

  button('allow_button', :xpath => "//UIAButton[@label='Разрешить']")
  button('deny_button', :xpath => "//UIAButton[@label='Отклонить']")

  def allow_access
    allow_button_click
  end
end