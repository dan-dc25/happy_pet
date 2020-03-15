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
    puts doc.css('div.column-set')
    hotel = doc.css('#results-list.entity-snapshot.entity-wrapper.info h2 a')
    hotel.each do |hotel|
      puts hotel.text.strip
    end
    hotel
   # price = doc.css('div.price.amount')
    #location = doc.css('div.subtitle')
    
    
   # binding.pry
  end
  
end


Scraper.new.get_page