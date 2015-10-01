require_relative 'PageLoader'

# https://www.dit.ie/timetables/PortalServ?reqtype=timetable&ttType=CLASS&sKey=201516|DT228|DT228/2|4-16
# Format:  Academic year(201516), Course(DT228), Course/Year(DT228/2), Weeks(4-16)
#	?reqtype=timetable&ttType=CLASS&sKey=DATE|COURSE|COURSE/YEAR|SEMESTERS

username = "students"
password = "timetables"

pageLoader = PageLoader.new "https://www.dit.ie/timetables/PortalServ?reqtype=timetable&ttType=CLASS&sKey=201516|DT228|DT228/2&weeks=4-16"

webPage = pageLoader.loadPage
puts webPage.inspect


loginForm = webPage.forms.first
loginForm['username'] = username
loginForm['userpassword'] = password

loggedInPage = loginForm.submit
