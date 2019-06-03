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
    data = 
  end

end
