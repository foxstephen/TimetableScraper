require_relative 'loginmanager'
require_relative 'timetable'

# TODO: Use adjacent CSS selectors to find all sessions between each row.

# Create new loogin and begin session
loginManager = LoginManager.new
webPage = loginManager.beginNewSession

timetable = Timetable.new 'DT228', '3'
someString = timetable.getTimetable

someString.inspect
