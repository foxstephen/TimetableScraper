require_relative 'loginmanager'
require_relative 'timetable'


# Create new loogin and begin session
loginManager = LoginManager.new
webPage = loginManager.beginNewSession

timetable = Timetable.new 'DT228', '3'
someString = timetable.getTimetable

puts someString.inspect
