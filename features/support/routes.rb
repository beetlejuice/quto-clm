Quto::Navigation.routes = {
    :default => [HomeScreen],
    :to_contacts => [[HomeScreen, :contact_button_click], [ContactsScreen]],
    :to_organizations => [[HomeScreen, :organizations_button_click], [OrganizationsScreen]],
    :to_visits => [[HomeScreen, :visits_button_click], [VisitsScreen]],
    :to_calendar => [[HomeScreen, :calendar_button_click], [CalendarScreen]],
    :to_events => [[HomeScreen, :events_button_click], [EventsScreen]],
    :to_messages => [[HomeScreen, :messages_button_click], [MessagesScreen]],
    :to_presentations => [[HomeScreen, :events_button_click], [PresentationsScreen]],
    :to_library => [[HomeScreen, :library_button_click], [LIbraryScreen]],
    :to_employees => [[HomeScreen, :employees_button_click], [EmployeesScreen]],
}