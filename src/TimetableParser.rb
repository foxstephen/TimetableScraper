require_relative 'sharedmechanize'

# This class can parse a timetable from the website
# into to be decided format.
class TimetableParser


    # Initializes a new instance with
    # that has the content of a timetable
    def initialize
        @shared_mechanize = SharedMechanize.instance
        @days = ['monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday']

        @timetable = {} # A hash map with a key(day) and a value(string) representing each day of a timetable
    end


    def parse_page(web_page)

        puts web_page.search('*')

    end


    # Counts the number of days a timetable will be
    # spread out over.
    #
    # Returns: The amount of days. [1-7] days.
    def count_days_for_timetable(web_page)
        supported_days = []

        @rows.each_with_index do |row, index|
            if !web_page.search('#' + row).empty?
                supported_days << web_page.search('#' + row)
            end
        end

        return supported_days.count
    end



    def get_timetable_for_course(course_code, year)
        generated_url = self.generate_url_for_course(course_code, year)

        page_loader = PageLoader.new generated_url

        # The first page we're brought to for the timetable.
        timetable_web_page = page_loader.load_page

        # The showGrid button
        show_grid_button = timetable_web_page.forms.first.button_with(:value => 'View Grid')

        # The form to which the showGrid button is attached.
        form = timetable_web_page.forms.first

        # Click the showGrid button
        show_grid_page = @shared_mechanize.submit(form, show_grid_button)

        parsed_page = self.parse_page(show_grid_page)

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
    def generate_url_for_course(course_code, year)
        date = '201516'
        weeks = '4-16'

        url = 'https://www.dit.ie/timetables/PortalServ?reqtype=timetable&ttType=CLASS&sKey=' + date + '|' + course_code + '|' + course_code + '/' + year + '|' + weeks

        return url
    end

end
