require_relative 'pageloader'

# Use this class to login to the DIT Timetables service.
class LoginManager

    username = "students"
    password = "timetables"


    # Will attempt to in to the DIT Timetable service.
    # Param: The url for the webpage.
    def login(url)
        pageLoader = PageLoader.new url
        webPage = pageLoader.loadPage

        
        # Check to see if redirected to login page.
        if (PageLoader.currentPage(webPage) == PageLoader::WEB_PAGE_LOGIN)

            # Login with username and password
            loginForm = webPage.forms.first
            loginForm['username'] = username
            loginForm['userpassword'] = password
            loggedInPage = loginForm.submit

            # TODO: Make these checks better (stephenfox)
            # Check to see if successfully logged in.
            if (PageLoader.currentPage(loggedInPage) == PageLoader::WEB_PAGE_LOGGED_IN)
                puts "Logged in"
                # Reload the URL passed in via the
                # constructor to pageLoader as we're now logged in.
                # We will be brought to whatever URL was specified in the constructor
                # of our PageLoader instance.
                webPage = pageLoader.loadPage
            end
        end

        return webPage
    end

end
