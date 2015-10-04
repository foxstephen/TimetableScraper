
# This class can parse a timetable from the website
# into to be decided format.
class TimetableParser


    # Initializes a new instance with
    # that has the content of a timetable
    def initialize
        @days = ['monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday']
        @rows = ['r0', 'r1', 'r2', 'r3', 'r4', 'r5', 'r6']
        @rowsPositions = {'r0' => 1, 'r1' => 481, 'r2' => 961, 'r3' => 1201, 'r4' => 1441} # The position of each row on the webpage
        @timetable = {} # A hash map with a key(day) and a value(string) representing each day of a timetable
    end


    def parsePage(webPage)

        # Get the number of days the timetable spans over.
        numberOfDaysForTimetable = self.countDaysForTimetable(webPage)

        for i in 0..numberOfDaysForTimetable
            rowPosition = @rowsPositions[@rows[i]].to_s

            puts webPage.search("#r0 + div[style*='top:1px']").text

            # end
            # @timetable[@days[i]] = webPage.search("div[style*='top:" + rowPosition + "px;']").text.tr('-', '').squeeze("\n")
            # puts @days[i]
            # puts @timetable[@days[i]]
        end


    end


    # Counts the number of days a timetable will be
    # spread out over.
    #
    # Returns: The amount of days. [1-7] days.
    def countDaysForTimetable(webPage)
        supportedDays = []

        @rows.each_with_index do |row, index|
            if !webPage.search('#' + row).empty?
                supportedDays << webPage.search('#' + row)
            end
        end

        return supportedDays.count
    end



    def getTimetableForCourse(courseCode, year)
        generatedURL = self.generateURLForCourse(courseCode, year)

        pageLoader = PageLoader.new generatedURL
        timetableWebPage = pageLoader.loadPage

        parsedPage = self.parsePage(timetableWebPage)
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
