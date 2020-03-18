require 'pry'
require 'nokogiri'
require 'open-uri'

class Scraper
  
 attr_accessor :name, :location, :price
 
 @@all = []
 
 def initialize
   @name = name
   @location = location
   @price = price
  end 
  
  def get_page
    
    url = "https://www.gopetfriendly.com/Hotels/new-york/new-york/1.aspx"    
    html = open(url)
    doc = Nokogiri::HTML(html)
    hotel = doc.css("#ContentPlaceHolder1_SearchResults_LocationsRepeater_LocationDiv_0.result.clearfix.hotel-result.featured").css("a")[0].text
    @@all << hotel
    #hotel.each do |hotel|
     # puts hotel.text.strip
    #end
    price = doc.css("#text.price")
    binding.pry
    #location = doc.css('div.subtitle')
    
    
   
  end
  
end


Scraper.new.get_page