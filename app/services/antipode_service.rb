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

  def get_json
    response = conn.get
    data = JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new("http://amypode.herokuapp.com/api/v1/antipodes?lat=#{}&long=#{}") do |f|
      f.headers['api_key'] = ENV['antipode_key']
  end

end
