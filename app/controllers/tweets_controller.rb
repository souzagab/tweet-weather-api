# frozen_string_literal: true

class TweetsController < ApplicationController
  rescue_from Ropenweather::Unauthorized, with: :unauthorized
  rescue_from Ropenweather::CityNotFound, with: :city_not_found

  def create
    tweet = TweetService.new(tweet_params).send

    if tweet
      render json: { url: tweet.url.to_s }, status: :created
    else
      head :unprocessable_entity
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:api_key, :city)
  end

  def city_not_found
    render json: { city: "Cidade Inválida ou não encontrada" }, status: 404
  end

  def unauthorized
    render json: { api_key: "Chave de api inválida. Visite http://openweathermap.org/faq#error401 para mais informações." }, status: 401
  end
end
