require 'pry'
require './lib/environment'


class HappyPet::CLI

    def call
      puts"Welcome to Happy Pet!"
      puts "We will show you pet friendly Hotels and Restaurants."
      menu
    end

    def menu
      puts "Please enter 1 for Hotels and 2 for Restaurants:"
      puts "Or enter 3 to exit:"
      input = gets.chomp
        if input == "1"
          hotels
        elsif input == "2"
          restaurants
        elsif input == "3"
          puts "We hate to see you go."
          exit
        else
          puts "Invalid input."
          menu
        end
      end

  def hotels
    city = get_city
    state = get_state
    puts "Showing you hotels in #{city}, #{state}..."
    Scraper.get_page(state, city)
    display_hotels
  end

  def get_city
    puts "Please enter the city you are traveling to."
    city = gets.chomp.downcase.split.join("-")
    until city.length > 3
      puts "Please, enter a valid city name."
      city = gets.chomp.downcase.split.join("-")
    end
    city
  end

  def get_state
    puts "Please, enter the state"
    state = gets.chomp.downcase.split.join("-")
      until state.length > 2
        puts "Please enter the full state name. I.e 'Florida'."
        puts "Please enter the state you are traveling to."
        state = gets.chomp.downcase.split.join("-")
      end
      state
  end

  def display_hotels
    Hotel.all.each_with_index do |hotel, index|
      puts "#{index +1} - #{hotel.name}."
    end
      more_info_hotel
    end

  def restaurants
    city = get_city
    state = get_state
    puts "Showing you restaurants in #{city}, #{state}..."
    Scraper.get_restaurant(state, city)
    display_restaurants
  end

  def display_restaurants
    Restaurant.all.each_with_index do |restaurant, index|
      puts "#{index +1} - #{restaurant.name}."
    end
    more_info_restaurant
  end

  def more_info_hotel
    puts "Would you like more information about the hotels? Y/N"
    input = gets.chomp.downcase
        if input == "y"
          Hotel.all.each_with_index do |hotel, index|
            puts "Here's the address for hotel number #{index + 1}"
            puts "#{hotel.info.gsub!(/\s+/, ' ')}"
          end
          menu
        elsif input == "n"
          puts "Taking you back to the main menu."
          menu
        elsif input == "q"
          puts "Taking you back to the main menu."
          menu
        else
          puts "Invalid input."
          more_info_hotel
        end
  end

    def more_info_restaurant
      puts "Would you like more information about the Restaurants? Y/N"
      input = gets.chomp.downcase
          if input == "y"
            Restaurant.all.each_with_index do |restaurant, index|
              puts "Here's the phone number and address for restaurant number #{index + 1}"
              puts "#{restaurant.info.gsub!(/\s+/, ' ')}."
            end
            menu
          elsif input == "n"
            puts "Taking you back to the main menu."
            menu
          elsif input == "q"
            puts "Taking you back to the main menu."
            menu
          else
            puts "Invalid input."
            more_info_restaurant
          end
      end

    def exit
      puts "Thank you for stopping by."
      puts "We hope we were able to find the 'purfect' destination for you and your furry friend."
      puts "Come back anytime!"
      puts "Goodbye!"
    end

end
