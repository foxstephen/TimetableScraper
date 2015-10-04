require 'mechanize'

# Use this class to use a shared 'mechanize'
# instance across different classes.
# The shared mechanize instance will hold
# a session after login.
class SharedMechanize
  @@mechanize_instance = Mechanize.new
  def self.instance
    return @@mechanize_instance
  end
end
