require_relative 'pageloader'

# Use this class to login to the DIT Timetables service.
class LoginManager

    def initialize
        @sessionURL = 'https://www.dit.ie/timetables/index.jsp'
        @username = 'students'
        @password = 'timetables'
    end


    # Will attempt to login and begin a new session
    # on the DIT Timetables website.
    # Returns: If successfully logged in returns the webPage.
    def beginNewSession

        puts "Attempting to login to: " + @sessionURL + '\n'

        pageLoader = PageLoader.new @sessionURL
        webPage = pageLoader.loadPage

        # Check to see if redirected to login page.
        if (PageLoader.currentPage(webPage) == PageLoader::WEB_PAGE_LOGIN)

            # Login with username and password
            loginForm = webPage.forms.first
            loginForm['username'] = @username
            loginForm['userpassword'] = @password
            loggedInPage = loginForm.submit

            if (PageLoader.currentPage(loggedInPage) == PageLoader::WEB_PAGE_LOGGED_IN)
                puts "Successfully logged into Timtable service at: " + loggedInPage.uri.to_s + "\n"

                return loggedInPage
            else
                puts "An error has occurred trying to log in at: " + loggedInPage.uri.to_s + "\n"
            end
        end
    end
end
