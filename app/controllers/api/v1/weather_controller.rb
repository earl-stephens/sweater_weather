module Api
  module V1
    class WeatherController < ApplicationController

      def index
        # binding.pry
        render json: {'location' => "#{params[:location]}",
                      'current' => CurrentWeatherSerializer.new.current_data,
                      'hourly' => HourlyWeatherSerializer.new.hourly_data,
                      'forecast' => ForecastWeatherSerializer.new.forecast_data
                      }
      end

    end
  end
end
