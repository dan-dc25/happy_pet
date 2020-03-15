require 'pry'
require 'nokogiri'
require 'open-uri'

class Scraper
  
 attr_accessor :name, :location, :price
 
 def initialize
   @name = name
   @location = location
   @price = price
  end 
  
  def get_page
    
    url = 'https://www.bringfido.com/lodging/'
    html = open(url)
    doc = Nokogiri::HTML(html)
    
    hotel = doc.css('div#results-list.info')
    price = doc.css('div.amount')
    location = doc.css('div.subtitle')
    
    binding.pry
  end
  
end


Scraper.new.get_page