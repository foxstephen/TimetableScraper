require_relative 'PageLoader'

username = "students"
password = "timetables"

pageLoader = PageLoader.new "https://www.dit.ie"

puts timetablePage = pageLoader.loadPage.inspect
