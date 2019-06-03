class GetWeatherFacade

  def initialize(location)
    @location = location
  end

  def get_location_id
    check_for_existing_location
    Location.find_by(name: @location)
    # binding.pry
  end

  def check_for_existing_location
    if Location.find_by(name: @location) == nil
      Updater.new(@location)
    end
  end

  def data
    # binding.pry
    currently = CurrentWeather.find_by(location_id: get_location_id.id)
    data = {"forecast" => forecast, "hourly" => hourly}
  end

  def current
    currently = CurrentWeather.find_by(@locale.id)
    {}
  end

  def forecast
    {"a" => "A", "b" => "B", "c" => "C", "d" => "D", "e" => "E", "f" => "F", "g" => "G", "h" => "H"}
  end

  def hourly
    {"day1" => "1", "day2" => "2"}
  end

end
