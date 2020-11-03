# frozen_string_literal: true
require 'rails_helper'

RSpec.describe "Tweets", type: :request do
  context '#create', :vcr do
    let(:headers) { { "Content-Type": "application/json" } }

    describe 'with valid params' do
      let(:tweet_params) { { api_key: ENV['OPEN_WEATHER_KEY'], city:'Campinas' } }
      it 'creates a tweet' do
        post tweet_path, params: tweet_params.to_json, headers: headers

        expect(response).to have_http_status(201)
        expect(JSON.parse(response.body)).to have_key('url')
      end
    end
    describe 'with invalid params' do
      let(:invalid_api_params) { { api_key: 's0m3-h4sh', city:'Campinas' } }
      let(:invalid_city_params) { { api_key: ENV['OPEN_WEATHER_KEY'], city:'S1nv4l1d1-c1tyy' } }
      it 'returns 401' do
        post tweet_path, params: invalid_api_params.to_json, headers: headers
        response_body = JSON.parse(response.body)

        expect(response).to have_http_status(401)
        expect(response_body).to have_key('api_key')
        expect(response_body['api_key']).to eq("Chave de api inválida. Visite http://openweathermap.org/faq#error401 para mais informações.")
      end

      it 'returns 404' do
        post tweet_path, params: invalid_city_params.to_json, headers: headers
        response_body = JSON.parse(response.body)

        expect(response).to have_http_status(404)
        expect(response_body).to have_key('city')
        expect(response_body['city']).to eq("Cidade Inválida ou não encontrada")
      end
    end

  end
end
