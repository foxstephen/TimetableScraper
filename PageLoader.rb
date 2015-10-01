require_relative 'SharedMechanize'

class PageLoader

  mechanizeInstance = SharedMechanize.instance

  # Initializes a new instance with a specified instance
  def initialize(url)
    @url = url
  end


  # Loads the page with associated with the instance.
  def loadPage
    return mechanize.get(@url)
  end


  # Class method for loading a page
  def self.loadPage(url)
    mechanize = Mechanize.new
    return mechanize.get(url)
  end

end
