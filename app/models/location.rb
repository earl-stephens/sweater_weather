class Location < ApplicationRecord

  has_many :current_weathers
  has_many :hourly_weathers
  has_many :forecast_weathers

end
