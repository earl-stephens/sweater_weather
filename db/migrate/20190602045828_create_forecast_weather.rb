class CreateForecastWeather < ActiveRecord::Migration[5.1]
  def change
    create_table :forecast_weathers do |t|
      t.json :forecast_wx_data
      t.references :location, foreign_key: true
      t.timestamps
    end
  end
end
