class CreateHourlyWeather < ActiveRecord::Migration[5.1]
  def change
    create_table :hourly_weathers do |t|
      t.json :hourly_wx_data
      t.references :location, foreign_key: true
      t.timestamps
    end
  end
end
