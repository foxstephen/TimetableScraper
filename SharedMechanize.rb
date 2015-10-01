require 'mechanize'

# This class shares a single `mechanize` instance
# througout a session.
class SharedMechanize:
  include Singleton

  def sharedInstance
end
