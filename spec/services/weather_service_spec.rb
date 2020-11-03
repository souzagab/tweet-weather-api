# frozen_string_literal: true
require 'rails_helper'

RSpec.describe WeatherService do
  subject { described_class.new(api_key: ENV['OPEN_WEATHER_KEY']) }

  describe 'have acessors for' do
    it 'client' do
      client = Ropenweather::Client.new(api_key: 'api_key')
      subject.client = client
      expect(subject.client).to eq(client)
    end

    it 'city' do
      subject.city = 'city'
      expect(subject.city).to eq('city')
    end
  end

  context '#initialize' do
    describe 'withouth api-key' do
      it 'must raise argument error' do
        expect { described_class.new }.to raise_error ArgumentError
      end
    end
  end

  context '#get_weather', :vcr do
    it 'without city argument must raise argument error' do
      expect { subject.get_weather }.to raise_error ArgumentError
    end

    describe 'with invalid api-key' do
      subject { described_class.new(api_key: 'h4sh-f0r-t3st') }

      it 'must raise Unauthorized Error' do
        expect { subject.get_weather(city: 'Campinas') }.to raise_error Ropenweather::Unauthorized
      end
    end

    describe 'with valid api-key' do
      it 'with invalid city must raise CityNotFound Error' do
        expect { subject.get_weather(city: '1nv4l1d1-c1ty') }.to raise_error Ropenweather::CityNotFound
      end

      describe 'with valid city' do
        let(:response) { subject.get_weather(city: 'Campinas') }
        let(:response_keys) { %i(today week) }
        it 'response type Hash ' do
          expect(response).to be_a(Hash)
        end

        it 'have respective keys' do
          response_keys.each { |key| expect(response).to have_key(key) }
        end
      end
    end
  end

  context '#current' do
    it 'returns Weather object' do
      allow(subject).to receive(:current).and_return kind_of(Weather)
    end
  end

  context '#forecasts' do
    it 'returns array of Weather objects' do
      allow(subject).to receive(:forecasts).and_return kind_of(Array)
    end
  end

  context '#time_gap' do
    it 'returns array of dates' do
      allow(subject).to receive(:time_gap).and_return kind_of(Array)
    end
  end

  context '#daily_average' do
    let(:forecasts) { [{ main: { temp: 5 } }, { main: { temp: 5 } }] }

    it 'returns average temperature' do
      allow(subject).to receive(:daily_average).with(forecasts).and_return(5)
    end
  end
end
