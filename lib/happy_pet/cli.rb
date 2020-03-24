require 'pry'
require './lib/environment'


class HappyPet::CLI
  
    def call
    puts ""
    puts "Welcome to Happy Pet! We will show you a list of pup friendly destinations."
    puts ""
    make_a_selection
    puts "Would you like more information in any of the hotels? Y/N"
    more_info
    make_a_selection
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
      puts "#{index +1} - #{restaurant.name}."
      puts "#{restaurant.info}"
    end
  end
  
  def more_info
    input = nil
    input = gets.chomp.downcase
        if input == "y"
          Hotel.all.each_with_index do |hotel, index|
            puts "Please enter number 1 to see more or 2 to exit."
            input = gets.chomp.downcase
            return if input != "1"
              puts "Here's the common price at the hotel number #{index + 1}"
              puts "#{hotel.price}."
              puts "Here's more information about hotel number #{index + 1}"
              puts "#{hotel.info}"
              puts "Type enter to go back to the main menu."
              exit = gets.chomp
          end
        elsif input == "n"
          puts "Type enter to go back to the main menu."
          exit = gets.chomp
          
        end
    end
    
    def exit
      puts "We hate to see you go."
      puts "Were we able to help you find the 'purfect' location for you and your furry pet?"
      puts "Enter YES or NO"
      input = nil 
      input = gets.chomp.downcase
      if input == "yes"
        puts "We are very happy to hear it."
        puts "Come back anytime!!!"
      elsif input == "no"
        puts "We are sorry we could not be of any help."
        puts "Have a great day!"
        puts "Goodbye."
      end
    end

  
  
end