class ChangeCurrentWeather < ActiveRecord::Migration[5.1]
  def change
    remove_column :current_weathers, :current_wx_data
  end
end
