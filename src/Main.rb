require_relative 'loginmanager'
require_relative 'timetableparser'


# See below for the following format for URLs.
# https://www.dit.ie/timetables/PortalServ?reqtype=timetable&ttType=CLASS&sKey=201516|DT228|DT228/2|4-16
# Format:  Academic year(201516), Course(DT228), Course/Year(DT228/2), Weeks(4-16)
#	?reqtype=timetable&ttType=CLASS&sKey=DATE|COURSE|COURSE/YEAR|SEMESTERS



# Specify the URL and login
loginManager = LoginManager.new

webPage = loginManager.login('https://www.dit.ie/timetables/PortalServ?reqtype=timetable&ttType=CLASS&sKey=201516|DT228|DT228/3&weeks=4-16')




# Check to see if we successfully logged in and
# the current webpage content is displaying a timetable.
if (PageLoader.currentPage(webPage) == PageLoader::WEB_PAGE_TIMETABLE)
  puts "go get it"
end
