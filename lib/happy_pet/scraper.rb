require 'pry'
require 'nokogiri'
require 'open-uri'

class HappyPet::Scraper
  
 attr_accessor :name, :location, :price
 
 @@all = []
 
 def initialize
    @name = name
    @location = location
    @price = price
  end 
  
  def self.get_page(city)
    url = "https://www.gopetfriendly.com/Hotels/pennsylvania/#{city}/1.aspx"    
    html = open(url)
    doc = Nokogiri::HTML(html)
    name = doc.css("#ContentPlaceHolder1_SearchResults_LocationsRepeater_LocationDiv_0.result.clearfix.hotel-result.featured").css("a")[0].text
    price = doc.css(".price")[0].text.gsub("As Low As", "").split
    location = doc.css("div#ContentPlaceHolder1_SearchResults_LocationsRepeater_up1_0").css("p")[0].tex
  end
  
  def self.show_hotels(state)
    puts "Here's a list of hotels in #{city}"
    name.each do |hotel|
      hotel.text.strip
    end
  
    puts name
    puts "Would you like to see a list of the top 5 hotels in #{city}?"
    puts " "
    puts "Enter y/n"
    input = gets.chomp.upcase
    if input == y
      puts name[0..4]
    else  
      puts "Here is the number 1 on the list :"
      name[0]
    end
    
    def self.info
      puts ""
      
  end
  
end
