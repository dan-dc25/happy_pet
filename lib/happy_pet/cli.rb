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
    puts "Welcome to Happy Pet! We will show you a list of pup friendly hotels. "
  end
  
   def destination
    puts " "
    puts "Please select the state you are traveling to."
    state = nil
    state = gets.chomp
    puts state
  end
  
  def show_hotels
    puts "Here's a list of hotels in #{state}"
    puts @hotels
  end
  
  
end