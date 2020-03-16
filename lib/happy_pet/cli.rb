require 'pry'
requirer './lib/happy_pet'

class CLI
  
    def call
    welcome
    destination
    show_hotels
  end
    
  def welcome
    puts ""
    puts "Welcome to Happy Pet! We will show you a list of pup friendly hotels."
  end
  
   def destination
    puts " "
    puts "Please enter the state you are traveling to."
    state = nil
    state = gets.chomp.upcase
  end
  
  def show_hotels
    puts "Here's a list of hotels in #{state}"
    puts @@all
    puts "Would you like to see a list of the top 5 hotels in #{state}?"
    puts " "
    puts "Enter y/n"
    input = gets.chomp.upcase
    if input == y
      puts @@all[0..4]
    else  
      puts @@all[0]
    
      
  end
  
  
end