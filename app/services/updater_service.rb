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
    @locale = Location.create(name: @location)

    add_location
    current_weather_update(add_location)
    # hourly_weather_update(add_location)
    # forecast_weather_update(add_location)
  end

  def add_location
    @grab_weather = DarkskyService.new(@location)
    @data_for_update = @grab_weather.get_weather_data
  end

  def current_weather_update(data)
    location_for_model = @grab_weather.get_google_location
    current_wx_record = CurrentWeather.find_or_create_by(location_id: @locale.id)
    current_wx_record.update(
                            icon: @data_for_update["currently"]["icon"],
                            temperature: @data_for_update["currently"]["temperature"],
                            feels_like: @data_for_update["currently"]["apparentTemperature"],
                            summary: @data_for_update["currently"]["summary"],
                            humidity: @data_for_update["currently"]["humidity"],
                            uv_index: @data_for_update["currently"]["uvIndex"],
                            visibility: @data_for_update["currently"]["visibility"],
                            time: @data_for_update["currently"]["time"],
                            today_forecast: @data_for_update["hourly"]["summary"],
                            high_temperature: @data_for_update["daily"]["data"][0]["temperatureHigh"],
                            low_temperature: @data_for_update["daily"]["data"][0]["temperatureLow"],
                            location_of_request: "#{location_for_model}"
    )
  end

end
