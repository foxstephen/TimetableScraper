require_relative 'SharedMechanize'

class PageLoader

  # Initializes a new instance with a specified instance
  def initialize(url)
    @url = url

    # Create our mechanized instance
    @mechanizeInstance = SharedMechanize.instance
  end


  # Loads the page with associated with the instance.
  def loadPage
    return @mechanizeInstance.get(@url)
  end

end
