class WeatherSerializer

  def initialize(location)
    @location = location
  end

  def data
    facade = GetWeatherFacade.new(@location)
    facade.data
  end

  def antipode_data
    facade = GetAntipodeWeatherFacade.new(@location)
    facade.data
  end

end
