require 'mechanize'

# Use this class to use a shared 'mechanize'
# instance across different classes.
class SharedMechanize

  @@mechanizeInstance = Mechanize.new

  def self.instance
    return @@mechanizeInstance
  end

end
