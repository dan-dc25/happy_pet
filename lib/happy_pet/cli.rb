require 'pry'
require './lib/environment'


class HappyPet::CLI

    def call
      menu
    end

    def menu
      puts"Welcome to Happy Pet!"
      puts "Would you like to look at Hotels and Restaurants?"
      puts "Please enter 1 to look at Hotels and Restaurants and 2 to leave:"
      input = gets.chomp
        if input == "1"
          make_a_selection
        elsif input == "2"
          exit
        elsif input == "3"
          puts "Press enter to exit"
          input = gets.chomp.downcase
          exit
        else
          puts "Invalid input."
          menu
        end
      end

  def make_a_selection
    puts "Enter H for Hotels or R for Restaurants."
    input = gets.chomp.downcase
    if input == "h"
       hotels
    elsif input == "r"
       restaurants
     elsif input == "q"
       puts "Press enter to exit"
       input = gets.chomp
       exit
    else
      puts "Invalid input."
      make_a_selection
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
    gets.chomp.downcase.split.join("-")
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
    puts "Would you like more information about the hotels? Y/N"
    input = nil
    input = gets.chomp.downcase
        if input == "y"
         more_info_hotel
        elsif input == "n"
          puts "Type enter to go back to the main menu."
          exit = gets.chomp
          menu
        end
  end

  def restaurants
    city = get_city
    state = get_state
    puts "Showing you hotels in #{city}, #{state}..."
    Scraper.get_restaurant(state, city)
    display_restaurants
  end

  def display_restaurants
    Restaurant.all.each_with_index do |restaurant, index|
      puts "#{index +1} - #{restaurant.name}."
    end
      puts "Would you like more information about the restaurants? Y/N"
    input = gets.chomp.downcase
        if input == "y"
          more_info_restaurant
        elsif input == "n"
          puts "Type enter to go back to the main menu."
          exit = gets.chomp
          menu
        end
  end

  def more_info_hotel
      puts "Please enter number 1 to see more or 2 to exit."
      input = gets.chomp.downcase
        return if input != "1"
        Hotel.all.each_with_index do |hotel, index|
          puts "Here's the address for hotel number #{index + 1}"
          puts "#{hotel.info.gsub!(/\s+/, ' ')}"
        end
          puts "Type enter to go back to the main menu."
          exit = gets.chomp
          menu
    end

    def more_info_restaurant
        puts "Please enter number 1 to see more or 2 to exit."
        input = gets.chomp.downcase
          return if input != "1"
          Restaurant.all.each_with_index do |restaurant, index|
            puts "Here's the phone number and address for restaurant number #{index + 1}"
            puts "#{restaurant.info.gsub!(/\s+/, ' ')}."
          end
            puts "Type enter to go back to the main menu."
            exit = gets.chomp
            menu
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
