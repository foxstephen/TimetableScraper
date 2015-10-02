require_relative 'pageloader'
require_relative 'timetableparser'

# https://www.dit.ie/timetables/PortalServ?reqtype=timetable&ttType=CLASS&sKey=201516|DT228|DT228/2|4-16
# Format:  Academic year(201516), Course(DT228), Course/Year(DT228/2), Weeks(4-16)
#	?reqtype=timetable&ttType=CLASS&sKey=DATE|COURSE|COURSE/YEAR|SEMESTERS

username = "students"
password = "timetables"


# Specify the URL and load the page.
pageLoader = PageLoader.new "https://www.dit.ie/timetables/PortalServ?reqtype=timetable&ttType=CLASS&sKey=201516|DT228|DT228/3&weeks=4-16"
webPage = pageLoader.loadPage


# Check to see if redirected to login page.
if (pageLoader.currentPage(webPage) == PageLoader::WEB_PAGE_LOGIN)
  # Login with username and password
  loginForm = webPage.forms.first
  loginForm['username'] = username
  loginForm['userpassword'] = password
  loggedInPage = loginForm.submit

  # Check to see if successfully logged in.
  if (pageLoader.currentPage(loggedInPage) == PageLoader::WEB_PAGE_LOGGED_IN)

    # Reload the URL passed in via the
    # constructor to pageLoader as we're now logged in.
    # We will be brought to whatever URL was specified in the constructor
    # of our PageLoader instance.
    webPage = pageLoader.loadPage

  elsif (pageLoader.currentPage(loggedInPage) == PageLoader::WEB_PAGE_UNKNOWN)
    abort("There was an error logging in.")
  end
end






# Check to see if we successfully logged in and
# the current webpage content is displaying a timetable.
if (pageLoader.currentPage(webPage) == PageLoader::WEB_PAGE_TIMETABLE)

end
