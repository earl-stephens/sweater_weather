module Api
  module V1
    class WeatherController < ApplicationController

      def index
        # query_location = formatted_location
        query_location = params[:location]
        serializer = WeatherSerializer.new(query_location)
        render json: {
                      "location" => "#{query_location}",
                      "weather_data" => serializer.data
                      }
      end

      private

      # def formatted_location
      #   split_location = params[:location].split(',')
      #   split_location[0] = split_location[0].split.map(&:capitalize).join(' ')
      #   split_location[1] = split_location[1].upcase
      #   split_location
      #   binding.pry
      # end
    end
  end
end
