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
        puts timetable.inspect

    end



    # Generates a URL for a given course and the year
    # of that course i.e 1st, 2nd year etc.
    def generateURLForCourse(courseCode, year)
        date = '201516'
        weeks = '4-16'

        url = 'https://www.dit.ie/timetabes/PortalServ?reqtype=timetable&ttType=CLASS&sKey=' + date + '|' + courseCode + '|' + courseCode + '/' + year + '|' + weeks

        return url
    end

end
