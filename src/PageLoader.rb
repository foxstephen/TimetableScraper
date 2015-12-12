require_relative 'sharedmechanize'

class PageLoader

  # Values which represent the web page of a scrape.
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
  # For grid view: https://www.dit.ie/timetables/PortalServreqtype=timetable&undefined=undefined&action=getgrid&sKey=201516%7CDT228%7CDT228%2F3%7C4-16&sWeeks=&sType=class&sYear=&sFromDate=&sToDate=&sEventType=&sModOccur=&sSource=&instCode=-2&instName=&useBooking=null&contactkey=&isBooking=null&subTitle=
  
  CURRENT_PAGE = [
    WEB_PAGE_LOGIN = '1',
    WEB_PAGE_LOGGED_IN = '2',
    WEB_PAGE_TIMETABLE = '3',
    WEB_PAGE_UNKNOWN = '4'
  ]


  # Initializes a new instance with a specified instance
  def initialize(url)
    @url = url
    # Create our mechanized instance
    @mechanize_instance = SharedMechanize.instance
  end


  # Loads the page with associated with the instance.
  def load_page
    @mechanize_instance.get(@url)
  end

  # Loads a web page with a given url.
  def page_for_url(url)
    @mechanize_instance.get(url)
  end


  # Returns the type of web page.
  #
  # Param: The webpage to check.
  # Returns: A value CURRENT_PAGE which represents which
  #         page is currently held.
  def self.current_page(web_page)
    if (web_page.uri.to_s == 'https://www.dit.ie/timetables/index.jsp')
      WEB_PAGE_LOGIN
    elsif (web_page.uri.to_s == 'https://www.dit.ie/timetables/PortalServ?reqtype=login')  
      WEB_PAGE_LOGGED_IN
    elsif (web_page.title.to_s == 'Timetable for ')
      WEB_PAGE_TIMETABLE
    else
      WEB_PAGE_UNKNOWN
    end
  end

end
