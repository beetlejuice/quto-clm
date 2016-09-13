class AuthorizationRequestScreen < GenericScreen
  button('allow_button', :xpath => "//UIAButton[@label='Разрешить']")
  button('deny_button', :xpath => "//UIAButton[@label='Отклонить']")

  def active?
    allow_button.displayed?
  end

  def allow_access
    allow_button_click
  end
end