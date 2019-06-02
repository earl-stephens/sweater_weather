module Api
  module V1
    class WeatherController < ApplicationController

      def index
        # binding.pry
        render json: {'location' => "#{params[:location]}",
                      'current' => CurrentSerializer.new(CurrentWeather.current_wx_data),
                      'hourly' => HourlySerializer.new(HourlyWeather.hourly_wx_data),
                      'forecast' => ForecastSerializer.new(ForecastWeather.forecast_wx_data)
                      }
      end

    end
  end
end
