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
    #puts hotel.text.strip
    #end
    price = doc.css(".price")[0].text.gsub("As Low As", "").split
    info = doc.css("div#ContentPlaceHolder1_SearchResults_LocationsRepeater_up1_0").css("p")[0].text
    binding.pry
  end
  
  def self.hotel()
    hotel.each do |hotel|
      puts hotel.text.strip
    end
  end
  
end

Scraper.new.get_page