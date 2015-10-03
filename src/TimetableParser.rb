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


    # See below for the following format for URLs.
    # https://www.dit.ie/timetables/PortalServ?reqtype=timetable&ttType=CLASS&sKey=201516|DT228|DT228/2|4-16
    # https://www.dit.ie/timetabes/PortalServ?reqtype=timetable&ttType=CLASS&sKey=201516|DT228|DT228/3|4-16
    # Format:  Academic year(201516), Course(DT228), Course/Year(DT228/2), Weeks(4-16)
    #	?reqtype=timetable&ttType=CLASS&sKey=DATE|COURSE|COURSE/YEAR|SEMESTERS


    # Generates a URL for a given course and the year
    # of that course i.e 1st, 2nd year etc.
    def generateURLForCourse(courseCode, year)
        date = '201516'
        weeks = '4-16'

        url = 'https://www.dit.ie/timetables/PortalServ?reqtype=timetable&ttType=CLASS&sKey=' + date + '|' + courseCode + '|' + courseCode + '/' + year + '|' + weeks

        return url
    end

end
