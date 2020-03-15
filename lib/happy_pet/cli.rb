require 'pry'
requirer './lib/happy_pet'

class CLI
  
    def call
    welcome
    user_select
  end
    
  def welcome
    puts ""
    puts "Welcome to Happy Pet! We will show you a list of pup friendly hotels. "
    puts ""
    puts "Where would you like to take your furry friend? "
  end
  
   def destination
    puts " "
    puts "Please select the state you are traveling to.  "
    input = nil
    input = gets.strip
  end
  
end