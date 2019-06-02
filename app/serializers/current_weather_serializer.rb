class CurrentWeatherSerializer
  # include FastJsonapi::ObjectSerializer
  # attributes :current_wx_data['temperature'],
  #            :current_wx_data['temperatureHigh']
  def current_data
    # set_hash
    JSON.generate(set_hash)
  end

  def set_hash
    current_conditions = CurrentWeather.new.current_wx_data
    current_data_hash = {
                        time: current_conditions['time'],
                        temperature: current_conditions['temperature'],
                        feels_like: current_conditions['apparentTemperature'],
                        high_temperature: current_conditions['temperatureHigh'],
                        low_temperature: current_conditions['temperatureLow'],
                        icon: current_conditions['icon'],
                        summary: current_conditions['summary'],
                        humidity: current_conditions['humidity'],
                        visibility: current_conditions['visibility'],
                        uv_index: current_conditions['uvIndex'],
    }
  end
end
