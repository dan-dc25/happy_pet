require 'pry'
require 'nokogiri'
require 'open-uri'

class Scraper
  
  
  def get_page
    page = Nokogiri::HTML(open("https://www.bringfido.com/lodging/"))
    binding.pry
  end
  
end

Scraper.new.get_page
