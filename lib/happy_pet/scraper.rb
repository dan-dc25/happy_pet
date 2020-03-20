class Scraper
  
  def self.get_page(state, city)
    url = "https://www.gopetfriendly.com/Hotels/#{state}/#{city}/1.aspx"    
    html = open(url)
    doc = Nokogiri::HTML(html)
    
    doc.css(".result.clearfix.hotel-result").each_with_index do |hotel, index|
     name = hotel.css("a").text
     info = hotel.css("p")[0].text
     price = doc.css(".price")[index].text.gsub("As Low As", "").split
     Hotel.new(name, info, price)
    end
  end
  
  def self.get_restaurant(state, city)
    url = "https://www.gopetfriendly.com/Restaurants/#{state}/#{city}/1.aspx"
    html = open(url)
    doc = Nokogiri::HTML(html)
    restaurants = {:name => doc.css("#ContentPlaceHolder1_SearchResults_LocationsRepeater_LocationDiv_0.result.clearfix.restaurant-result").css("a")[0].text,
    :address => doc.css("#ContentPlaceHolder1_SearchResults_LocationsRepeater_up1_0").css("p")[0].text
    }
    binding.pry
  end
  
  def show_hotels
    puts "Here's a list of hotels in "
    hotels = @@all
    hotels.each do |key, value|
      puts "#{key}, #{value}"
    end
    binding.pry
  
    #puts name
    #puts "Would you like to see a list of the top 5 hotels in #{city}?"
    #puts " "
    #puts "Enter y/n"
    #input = gets.chomp.upcase
    #if input == y
    #  puts name[0..4]
    #else  
    #  puts "Here is the number 1 on the list :"
    #  name[0]
    #end
  end
  
end

