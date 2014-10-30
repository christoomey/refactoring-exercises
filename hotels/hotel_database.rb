require "csv"
require "./listing"
require "./hotel"
require "./null_hotel"

class HotelDatabase
  def initialize(file_name)
    @hotels = {}
    read_in_hotels(file_name)
  end

  def prompt_user
    name = ask_user_which_hotel
    hotel = find_hotel(name)
    Listing.new(hotel).describe
  end

  private

  def ask_user_which_hotel
    print "Which property? > "
    gets.chomp
  end

  def find_hotel(name)
    @hotels.fetch(name, NullHotel.new)
  end

  def read_in_hotels(file_name)
    CSV.foreach(file_name, headers: true) do |row|
      hotel = Hotel.new(row)
      @hotels[hotel.name] = hotel
    end
  end
end

hotel_database = HotelDatabase.new('hotels.csv')
hotel_database.prompt_user
