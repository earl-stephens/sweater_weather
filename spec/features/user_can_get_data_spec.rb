require "rails_helper"

describe 'a user can get weather data' do
  it 'via an api call' do
    get '/api/v1/forecast?location=denver,co', headers: {'Accept' => 'application/json', 'Content-Type' => 'application/json'}

    expect(response).to be_successful

    # wx_data = JSON.parse(response.body)
    expect(response.body['hourly'].length).to eq(48)
    expect(response.body['forecast'].length).to eq(8)
    expect(response.body['location']).to eq('Denver, CO')
  end
end
