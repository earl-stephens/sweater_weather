class GoogleService

  def initialize(location)
    @location = location
  end

  def get_coordinates
    results = get_json
    # binding.pry
    coordinates = results[:results][0][:geometry][:bounds][:northeast][:lat].round(4).to_s +
                  "," +
                  results[:results][0][:geometry][:bounds][:northeast][:lng].round(4).to_s
  end

  def get_location
    results = get_json
    results[:results][0][:formatted_address]
  end

  private

  def get_json
    # binding.pry
    @_response ||= conn.get("api/geocode/json?address=#{@location}&key=#{ENV['google_key']}")
    data = JSON.parse(@_response.body, symbolize_names: true)
    # binding.pry
  end

  def conn
    Faraday.new("https://maps.googleapis.com/maps?key=#{ENV['google_key']}") do |f|
      f.adapter Faraday.default_adapter
    end
  end

end
