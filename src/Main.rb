require_relative 'loginmanager'
require_relative 'pageloader'
require_relative 'timetableparser'


# Create new loogin and begin session
loginManager = LoginManager.new
webPage = loginManager.beginNewSession

parser = TimetableParser.new
parser.getTimetableForCourse('DT228', '3')
