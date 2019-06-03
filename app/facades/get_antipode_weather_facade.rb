class GetAntipodeWeatherFacade

  def initialize(location)
    @location = location
    @antipode = true
  end

  def get_location_id
    perform_updates(@antipode)
    Location.find_by(name: @location)
  end

  def perform_updates(@antipode)
    updater = UpdaterService.new(@location, @antipode)
    updater.update_records
  end

  def data
    data = {"type" => "antipode",
            "attributes" => {"location_name" => "antipode",
                            "forecast" => current},
            "search_location" => "#{get_location_id.name}"}
  end

  def current
    current_location = get_location_id
    currently = CurrentWeather.find_by(location_id: current_location.id)
    {"summary" => currently.summary,
     "current_temperature" => currently.temperature
    }
  end

end
