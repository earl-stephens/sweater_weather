class CreateCurrentWeather < ActiveRecord::Migration[5.1]
  def change
    create_table :current_weathers do |t|
      t.json :current_wx_data
      t.references :location, foreign_key: true
      t.timestamps
    end
  end
end
