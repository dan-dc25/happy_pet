require 'pry'
require './lib/environment'


class HappyPet::CLI
  
    def call
    puts ""
    puts "Welcome to Happy Pet! We will show you a list of pup friendly destinations."
    puts ""
    make_a_selection
    puts "Would you like more information in any of the hotels? Y/N"
    puts more_info
    exit
  end
    
  def make_a_selection
    puts " "
    puts "Would you like to look at hotels or restaurants?"
    puts "Enter 1 for Hotels or 2 for Restaurants."
    input = nil
    input = gets.chomp
    if input == "1"
       hotels
    elsif input == "2" 
      puts restaurants
    else 
      puts "Please enter 1 for Hotels or 2 for Restaurants."
    end
  
  end
    
    
  def hotels
    puts "Please enter the city you are traveling to."
    city = nil
    city = gets.chomp.downcase.split.join("-")
    puts "Please, enter the state"
    state = nil
    state = gets.chomp.downcase.split.join("-")
    puts "Showing you hotels in #{city}, #{state}..."
    Scraper.get_page(state, city)
    display_hotels
  end
  
  def display_hotels
    Hotel.all.each_with_index do |hotel, index|
      puts "#{index +1} - #{hotel.name}."
    end
  end
  
  def restaurants
     puts "Please enter the city you are traveling to."
    city = nil
    city = gets.chomp.downcase.split.join("-")
    puts "Please, enter the state"
    state = nil
    state = gets.chomp.downcase.split.join("-")
    puts "Showing you hotels in #{city}, #{state}..."
    Scraper.get_restaurant(state, city)
    display_restaurants
  end
  
  def display_restaurants
    Restaurant.all.each_with_index do |restaurant, index|
      puts "#{index}- #{restaurant}"
    end
  end
  
  def more_info
    input = nil
    input = gets.chomp.downcase
      Hotel.all.each_with_index do |hotel, index|
        if input == y
          puts "#{index +1} - #{hotel.price}."
          puts "#{info}."
        elsif input == n
          puts "Type exit to leave the program."
        end
      end
      exit
    end
    
    def exit
      puts "We hate to see you go."
      puts "But we hope you had a great time"
      puts "And we hope you found the purfect hotel for you and your furry friend!"
      puts "Goodbye."
    end

  
  
end