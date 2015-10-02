require 'mechanize'

# Use this class to use a shared 'mechanize'
# instance across different classes.
# The shared mechanize instance will hold
# a session after login.
class SharedMechanize

    @@mechanizeInstance = Mechanize.new

    def self.instance
        return @@mechanizeInstance
    end
end
