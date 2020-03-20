class Restaurant
  
  attr_accessor :name, :info
  
  @@all = []
  
  def initialize(name, info)
    @name = name
    @info = info
    @@all << self
  end
  
  def self.all
    @@all
  end
  
end