class AntipodeService

  def initialize(location)
    @location = location
    # binding.pry
  end

  def get_coordinates
    results = get_json
    coordinates = results[:attributes][:lat].to_s +
                  "," +
                  results[:attributes][:long].to_s
  end

  private

  def location_lat
    @location.split(',').first
  end

  def location_long
    @location.split(',').last
  end

  def get_json
    response = conn.get
    data = JSON.parse(response.body, symbolize_names: true)
    # binding.pry
  end

  def conn
    Faraday.new("http://amypode.herokuapp.com/api/v1/antipodes?lat=#{location_lat}&long=#{location_long}") do |f|
      f.headers['api_key'] = ENV['antipode_key']
      f.adapter Faraday.default_adapter
    end
  end

end
