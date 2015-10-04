require_relative 'sharedmechanize'

# This class can parse a timetable from the website
# into to be decided format.
class TimetableParser


    # Initializes a new instance with
    # that has the content of a timetable
    def initialize
        @sharedMechanize = SharedMechanize.instance
        @days = ['monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday']

        @timetable = {} # A hash map with a key(day) and a value(string) representing each day of a timetable
    end


    def parsePage(webPage)

        puts webPage.search('*')

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

        # The first page we're brought to for the timetable.
        timetableWebPage = pageLoader.loadPage

        # The showGrid button
        showGridButton = timetableWebPage.forms.first.button_with(:value => 'View Grid')

        # The form to which the showGrid button is attached.
        form = timetableWebPage.forms.first

        # Click the showGrid button
        showGridPage = @sharedMechanize.submit(form, showGridButton)
        parsedPage = self.parsePage(showGridPage)

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
