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


# Login with username and password
loginForm = webPage.forms.first
loginForm['username'] = username
loginForm['userpassword'] = password
loggedInPage = loginForm.submit

# Reload the URL passed in via the
# constructor as we're now logged in.
webPage = pageLoader.loadPage


if webPage.title == "Timetable for"
  timetableParser = TimetableParser.new
  timetableParser.parsePageToOutput(webPage)
end
