require 'mechanize'

# This class shares a single `mechanize` instance
# througout a session.
class SharedMechanize

  @@mechanizeInstance = Mechanize.new

  def self.instance
    return @@mechanizeInstance
  end

end
