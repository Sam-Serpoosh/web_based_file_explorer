class Directory
  attr_reader :path
  
  def initialize(path)
    @path = path
  end
end

class PureFile
  attr_reader :path

  def initialize(path)
    @path = path
  end
end
