class UpdaterService

  def initialize(location, antipode=false)
    @location = location
    @antipode = antipode
    # binding.pry
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
    current_weather_update
    hourly_weather_update
    forecast_weather_update
  end

  def add_location
    antipode = @antipode
    @grab_weather = DarkskyService.new(@location, antipode)
    @data_for_update = @grab_weather.get_weather_data
  end

  def current_weather_update
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

  def hourly_weather_update
    hourly_wx_record = HourlyWeather.find_or_create_by(location_id: @locale.id)
    hourly_wx_record.update(hourly_wx_data: @data_for_update["hourly"])
  end

  def forecast_weather_update
    forecast_wx_record = ForecastWeather.find_or_create_by(location_id: @locale.id)
    forecast_wx_record.update(forecast_wx_data: @data_for_update["daily"])
  end

end
