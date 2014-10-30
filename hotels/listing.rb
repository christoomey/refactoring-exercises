class Listing
  def initialize(hotel)
    @hotel = hotel
  end

  def describe
    puts ""
    puts "Phone Number: #{hotel.phone}"
    puts "Location: #{hotel.location}"
    puts "Number of Rooms: #{hotel.total_rooms}"
    puts ""
  end

  private

  attr_reader :hotel
end
