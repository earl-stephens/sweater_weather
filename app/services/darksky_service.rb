class DarkskyService

  def initialize(location)
    @location = location
  end

  def get_weather_data
    find_coordinates
    response = conn.get
    data = JSON.parse(response.body)
    # binding.pry
  end

  def find_coordinates
    @google_coordinates = GoogleService.new(@location)
    @google_coordinates.get_coordinates
  end

  def get_google_location
    @google_coordinates.get_location
  end

  private

  def conn
    Faraday.new("https://api.darksky.net/forecast/#{ENV['dark_sky_api']}/#{find_coordinates}") do |f|
      f.adapter Faraday.default_adapter
    end
  end

end
