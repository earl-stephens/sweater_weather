class UpdaterService

  def initialize(location)
    @location = location
  end

  def check_records
    if location_exists?
      return
    else
      update_records
    end
  end

  def location_exists?
    if Location.find_by(name: @location)
      true
    else
      false
    end
  end

  def update_records
    add_location
    current_weather_update(add_location)
    hourly_weather_update(add_location)
    forecast_weather_update(add_location)
  end

  def add_location
    Location.create!(name: @location)
    grab_weather = DarkskyService.new(@location)
    grab_weather.get_weather_data
  end

end
