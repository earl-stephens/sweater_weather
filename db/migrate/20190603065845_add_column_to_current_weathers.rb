class AddColumnToCurrentWeathers < ActiveRecord::Migration[5.1]
  def change
    add_column :current_weathers, :icon, :string
    add_column :current_weathers, :summary, :string
    add_column :current_weathers, :temperature, :string
    add_column :current_weathers, :high_temperature, :string
    add_column :current_weathers, :low_temperature, :string
    add_column :current_weathers, :location, :string
    add_column :current_weathers, :time, :string
    add_column :current_weathers, :today_forecast, :string
    add_column :current_weathers, :feels_like, :string
    add_column :current_weathers, :humidity, :string
    add_column :current_weathers, :visibility, :string
    add_column :current_weathers, :uv_index, :string
  end
end
