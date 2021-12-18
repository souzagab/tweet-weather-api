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
    render json: { city: "City not found" }, status: :not_found
  end

  def unauthorized
    render json: { api_key: "Invalid Api-key. Check http://openweathermap.org/faq#error401 for more info." },
           status: :unauthorized
  end
end
