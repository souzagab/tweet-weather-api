# frozen_string_literal: true
require 'rails_helper'

RSpec.describe TweetService, :vcr do
  subject { described_class.new({ api_key: ENV['OPEN_WEATHER_KEY'], city: 'Campinas' }) }

  context '#initialize' do
    describe 'without arguments raise KeyError' do
      it 'api_key' do
        expect { described_class.new }.to raise_error KeyError
      end
      it 'city' do
        expect { described_class.new({ api_key: 'h4sh-t3st' }) }.to raise_error KeyError
      end
    end
  end

  context '#send' do
    it 'returns Tweet' do
      allow(subject).to receive(:send).and_return kind_of(Twitter::Tweet)
    end
  end

  describe 'have acessors for' do
    it 'forecast_today' do
      forecast_today = Weather.new(temp: 23)
      subject.forecast_today = forecast_today
      expect(subject.forecast_today).to eq(forecast_today)
    end

    it 'forecast_week' do
      forecast_week = [Weather.new(temp: 23)]
      subject.forecast_week = forecast_week
      expect(subject.forecast_week).to eq(forecast_week)
    end

    it 'city' do
      subject.city = 'city'
      expect(subject.city).to eq('city')
    end
  end

  context '#client' do
    it 'returns new Twitter client' do
      allow(subject).to receive(:client).and_return kind_of(Twitter::REST::Client)
    end
  end

  context '#message' do
    it 'returns string' do
      allow(subject).to receive(:message).and_return kind_of(String)
    end
  end
end
