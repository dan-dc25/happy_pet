require 'pry'
require './lib/environment'


class HappyPet::CLI
  
    def call
    welcome
    destination
    
  end
    
  def welcome
    puts ""
    puts "Welcome to Happy Pet! We will show you a list of pup friendly hotels."
  end
  
   def destination
    puts " "
    puts "Please enter the city you are traveling to."
    city = nil
    city = gets.chomp.downcase
    puts "Showing you hotels in #{city}..."
    HappyPet::Scraper.get_page(city)
  end
  

  
  
end