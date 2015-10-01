require_relative 'PageLoader'
require_relative 'TimetableParser'

# https://www.dit.ie/timetables/PortalServ?reqtype=timetable&ttType=CLASS&sKey=201516|DT228|DT228/2|4-16
# Format:  Academic year(201516), Course(DT228), Course/Year(DT228/2), Weeks(4-16)
#	?reqtype=timetable&ttType=CLASS&sKey=DATE|COURSE|COURSE/YEAR|SEMESTERS

username = "students"
password = "timetables"


# Specify the URL and load the page.
pageLoader = PageLoader.new "https://www.dit.ie/timetables/PortalServ?reqtype=timetable&ttType=CLASS&sKey=201516|DT228|DT228/3&weeks=4-16"
webPage = pageLoader.loadPage

puts "Login uri: " + webPage.uri.inspect

# Login with username and password
loginForm = webPage.forms.first
loginForm['username'] = username
loginForm['userpassword'] = password
loggedInPage = loginForm.submit

puts "Logged in uri: " + loggedInPage.uri.inspect

# Reload the URL passed in via the
# constructor to pageLoader as we're now logged in.
webPage = pageLoader.loadPage


# Check to see if we successfully logged in and
# the current webpage content is displaying a timetable.
if webPage.title == 'Timetable for '
  timetableParser = TimetableParser.new
  puts timetableParser.parsePageToOutput(webPage).inspect
end
