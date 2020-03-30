require 'pry'
require 'nokogiri'
require 'open-uri'

class Scraper

  def self.get_page(state, city)
    url = "https://www.gopetfriendly.com/Hotels/#{state}/#{city}/1.aspx"
    html = open(url)
    doc = Nokogiri::HTML(html)

    doc.css(".result.clearfix.hotel-result").each_with_index do |hotel, index|
     name = hotel.css("a")[0].text
     info = hotel.css("p")[0].text
     Hotel.new(name, info)
    end
  end

  def self.get_restaurant(state, city)
    url = "https://www.gopetfriendly.com/Restaurants/#{state}/#{city}/1.aspx"
    html = open(url)
    doc = Nokogiri::HTML(html)
    doc.css(".result.clearfix.restaurant-result").each do |restaurant|
      name = restaurant.css("a")[0].text
      info = restaurant.css("p")[0].text
      Restaurant.new(name, info)
    end
  end

end
