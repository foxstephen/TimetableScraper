require_relative 'timetableparser'


class Timetable
  
  def initialize(courseCode, year)
    @courseCode = courseCode
    @year = year
    @timetable_parser = TimetableParser.new
  end

  # Returns the timetable for the course
  # an instance was initialised with.
  #
  # Returns: A timetable for a course.
  def get_timetable
    @timetable_parser.get_timetable_for_course(@courseCode, @year)
  end
end
