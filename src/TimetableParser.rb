require_relative 'timetableparser'


# This class can parse a timetable from the website
# into to be decided format.
class TimetableParser

    # Initializes a new instance with
    # that has the content of a timetable
    def initialize
        @mechanizeInstance = SharedMechanize.instance
    end


    def parsePageToOutput(timetableWebPage)
        htmlParser = Nokogiri::HTML(timetableWebPage.body)
        return htmlParser.css('.d0')
    end



    def getTimetableForCourse(courseCode, year)
        url = self.generateURLForCourse(courseCode, year)

        pageLoader = PageLoader.new url
        timetable = pageLoader.loadPage


    end



    # Generates a URL for a given course and the year
    # of that course i.e 1st, 2nd year etc.
    #
    # Information on generating URLs.
    #
    # A URL for a course's timetable must be in the following format:
    #   Format:  Academic year(201516), Course(DT228), Course/Year(DT228/2), Weeks(4-16)
    #
    # When represented as a actual URL it should look something like this.
    # https://www.dit.ie/timetables/PortalServ?reqtype=timetable&ttType=CLASS&sKey=201516|DT228|DT228/2|4-16
    #
    def generateURLForCourse(courseCode, year)
        date = '201516'
        weeks = '4-16'

        url = 'https://www.dit.ie/timetables/PortalServ?reqtype=timetable&ttType=CLASS&sKey=' + date + '|' + courseCode + '|' + courseCode + '/' + year + '|' + weeks

        return url
    end

end
