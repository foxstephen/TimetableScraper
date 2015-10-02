require_relative 'sharedmechanize'

class PageLoader

  # Values which represent the web page of
  # a scrape.
  #
  #   LOGIN_WEB_PAGE is the web page which requests any
  #                  user of the timetable system to login.
  #                  Link: https://www.dit.ie/timetables/index.jsp
  #
  #   LOGGED_IN_WEB_PAGE is the web page any user is brought to after
  #                      successfully logging in.
  #
  #   TIMETABLE_WEB_PAGE is the web page that is shown when
  #                      the following link: https://www.dit.ie/timetables/PortalServ?reqtype=timetable&ttType=CLASS&sKey=201516|DT228|DT228/2|4-16 parameters are set and correct. See Main.rb for parameters.
  #
  #
  CURRENT_PAGE = [WEB_PAGE_LOGIN = '1',
                  WEB_PAGE_LOGGED_IN = '2',
                  WEB_PAGE_TIMETABLE = '3',
                  WEB_PAGE_UNKNOWN = '4'
                ]

  # Initializes a new instance with a specified instance
  def initialize(url)
    @url = url

    # Create our mechanized instance
    @mechanizeInstance = SharedMechanize.instance
  end


  # Loads the page with associated with the instance.
  def loadPage
    return @mechanizeInstance.get(@url)
  end

  # Loads a web page with a given url.
  def pageForURL(url)
    return @mechanizeInstance.get(url)
  end


  # Returns the current web page.
  #
  # Params: The webpage to check.
  # Retuns: A value CURRENT_PAGE which represents which
  #         page is currently held.
  def currentPage(webPage)
    if (webPage.uri == 'https://www.dit.ie/timetables/index.jsp')
      return WEB_PAGE_LOGIN
    elsif (webPage.uri == 'https://www.dit.ie/timetables/PortalServ?reqtype=login')
      return WEB_PAGE_LOGGED_IN
    elsif (webPage.title == 'Timetable for ')
      return WEB_PAGE_TIMETABLE
    else
      return WEB_PAGE_UNKNOWN
    end
  end



end
