class GooglemapsService

  def initialize
    @connection = Faraday.new('address')
    @connection.headers['key'] = ENV['googlemaps_key']
  end

  def get_coordinates(location_hash)
    location_hash[:street_address] = street_address
    location_hash[:city] = city
    location_hash[:state] = state
    @connection.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{street_address},+#{city},+#{city}&key="ENV['googlemaps_key'])
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def geocode_hash(location)
    parse(get_coordinates(location))
  end



end
