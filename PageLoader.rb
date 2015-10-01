require_relative 'SharedMechanize'

class PageLoader

  @mechanizeInstance = SharedMechanize.instance

  # Initializes a new instance with a specified instance
  def initialize(url)
    @url = url
  end


  # Loads the page with associated with the instance.
  def loadPage
    return @mechanizeInstance.get(@url)
  end
  
end
