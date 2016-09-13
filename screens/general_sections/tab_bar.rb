class TabBar < GenericSection
  button('calendar_button', :name => 'Календарь')
  button('visits_button', :name => 'Визиты')
  button('contacts_button', :name => 'Контакты')
  button('organizations_button', :name => 'Организации')
  button('events_button', :name => 'Мероприятия')
  button('messages_button', :name => 'Сообщения')
  button('presentations_button', :name => 'Презентации')
  button('library_button', :name => 'Библиотека')

  def navigate_to_chapter chapter
    click_method = chapter + '_button_click'
    self.send(click_method)
  end
end