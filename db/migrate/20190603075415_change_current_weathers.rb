class ChangeCurrentWeathers < ActiveRecord::Migration[5.1]
  def change
    rename_column :current_weathers, :location, :location_of_request
  end
end
