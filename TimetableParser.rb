require_relative 'SharedMechanize'


# This class can parse a timetable from the website
# into to be decided format.
class TimetableParser

  # Initializes a new instance with
  # that has the content of a timetable
  def initialize(timetableWebPage)
    @mechanizeInstance = SharedMechanize.instance
  end


  def parsePageToOutput(timetableWebPage)
    @allDays = timetableWebPage.search "div id = 'd0'"
    puts allDays.inspect
  end


end
