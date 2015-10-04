require_relative 'pageloader'

# Use this class to login to the DIT Timetables service.
class LoginManager

    def initialize
        @session_url = 'https://www.dit.ie/timetables/index.jsp'
        @username = 'students'
        @password = 'timetables'
    end


    # Will attempt to login and begin a new session
    # on the DIT Timetables website.
    # Returns: If successfully logged in returns the webPage.
    def begin_new_session

        puts "Attempting to login to: " + @session_url + '\n'

        page_loader = PageLoader.new @session_url
        web_page = page_loader.load_page()

        # Check to see if redirected to login page.
        if (PageLoader.current_page(web_page) == PageLoader::WEB_PAGE_LOGIN)

            # Login with username and password
            login_form = web_page.forms.first
            login_form['username'] = @username
            login_form['userpassword'] = @password
            logged_in_page = login_form.submit

            if (PageLoader.current_page(logged_in_page) == PageLoader::WEB_PAGE_LOGGED_IN)
                puts "Successfully logged into Timtable service at: " + logged_in_page.uri.to_s + "\n"

                return logged_in_page
            end
        end
    end
end
