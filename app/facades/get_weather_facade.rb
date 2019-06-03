class GetWeatherFacade

  def initialize(location)
    @location = location
  end

  def get_location_id
    perform_updates
    Location.find_by(name: @location)
    # binding.pry
  end

  def perform_updates
    updater = UpdaterService.new(@location)
    updater.update_records
  end

  def data
    # binding.pry
    # currently = CurrentWeather.find_by(location_id: get_location_id.id)
    # data = {"forecast" => forecast, "hourly" => hourly}
    # binding.pry
    data = {"currently" => current, "hourly" => hourly_section.hourly_wx_data, "forecast" => forecast_section.forecast_wx_data}
  end

  def current
    current_location = get_location_id
    currently = CurrentWeather.find_by(location_id: current_location.id)
    # binding.pry
    {"icon" => currently.icon,
     "temperature" => currently.temperature,
     "feels_like" => currently.feels_like,
     "summary" => currently.summary,
     "humidity" => currently.humidity,
     "uv_index" => currently.uv_index,
     "visibility" => currently.visibility,
     "time" => currently.time,
     "today_forecast" => currently.today_forecast,
     "high_temperature" => currently.high_temperature,
     "low_temperature" => currently.low_temperature,
     "location_of_request" => currently.location_of_request,
    }
  end

  def forecast_section
    current_location = get_location_id
    ForecastWeather.find_by(location_id: current_location.id)
  end

  def hourly_section
    current_location = get_location_id
    hourly = HourlyWeather.find_by(location_id: current_location.id)
  end

end
