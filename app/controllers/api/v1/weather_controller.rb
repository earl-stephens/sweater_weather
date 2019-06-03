module Api
  module V1
    class WeatherController < ApplicationController

      def index
        # query_location = formatted_location
        query_location = params[:location]
        serializer = WeatherSerializer.new(query_location)
        render json: { "weather_data" => serializer.data }
      end
    end
  end
end
