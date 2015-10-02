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
end
