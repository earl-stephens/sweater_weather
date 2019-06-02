require "rails_helper"

RSpec.describe Location, type: :model do
  describe 'relationships' do
    it { should have_many :current_weathers }
    it { should have_many :forecast_weathers }
    it { should have_many :hourly_weathers }
  end
end
