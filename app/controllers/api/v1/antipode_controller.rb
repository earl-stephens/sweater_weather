module Api
  module V1
    class AntipodeController < ApplicationController

      def index
# binding.pry
        query_location = params[:loc]
        serializer = WeatherSerializer.new(query_location)
        render json: { "weather_data" => serializer.antipode_data}
      end
    end
  end
end
