require 'spec_helper'

RSpec.describe 'Strava::Api::Client#gear' do
  let(:client) { Strava::Api::Client.new(access_token: ENV['STRAVA_ACCESS_TOKEN'] || 'access-token') }
  it 'returns gear', vcr: { cassette_name: 'client/gear' } do
    gear = client.gear(id: 'g3423618')
    expect(gear).to be_a Strava::Models::Gear
    expect(gear.id).to eq 'g3423618'
    expect(gear.resource_state).to eq 3
    expect(gear.distance).to eq 380_939.0
    expect(gear.distance_in_miles_s).to eq '236.7mi'
    expect(gear.name).to eq 'adidas Supernova ST'
    expect(gear.primary).to be true
    expect(gear.brand_name).to eq 'adidas'
    expect(gear.model_name).to eq 'Supernova ST'
    expect(gear.description).to eq 'Marathon 2018.'
  end
end