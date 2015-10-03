require_relative 'timetableparser'


class Timetable

    def initialize(courseCode, year)
        @courseCode = courseCode
        @year = year

        @timetableparser = TimetableParser.new
    end


    # Returns the timetable for the course
    # an instance was initialised with.
    #
    # Returns: A timetable for a course.
    def getTimetable
        return @timetableparser.getTimetableForCourse(@courseCode, @year)
    end
end
