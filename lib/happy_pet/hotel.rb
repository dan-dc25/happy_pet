class Hotel
  
  attr_accessor :name, :info, :price
  
  @@all = []
  
  def initialize(name, info, price)
    @name = name
    @info = info
    @price = price
    @@all << self
  end
  
  def self.all
    @@all
  end
  
end
