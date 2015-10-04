require_relative 'loginmanager'
require_relative 'timetable'

# TODO: Use adjacent CSS selectors to find all sessions between each row.

# Create new loogin and begin session
login_manager = LoginManager.new
web_page = login_manager.begin_new_session()

timetable = Timetable.new 'DT228', '3'
some_string = timetable.get_timetable()
