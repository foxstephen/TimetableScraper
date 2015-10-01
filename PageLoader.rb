require_relative 'SharedMechanize'

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
  CURRENT_PAGE = [LOGIN_WEB_PAGE = 0,
                  LOGGED_IN_WEB_PAGE = 1,
                  TIMETABLE_WEB_PAGE = 2
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
    if (webPage.url == "CMIS ePortal")
      return LOGIN_WEB_PAGE
    elsif (webPage.title == "Timetable for ")
      return TIMETABLE_WEB_PAGE
      el

    end
  end



end
