class TweetService
  attr_accessor :forecast_today, :forecast_week, :city

  def initialize(options = {})
    self.city = options.fetch(:city)
    forecasts = WeatherService.new(api_key: options.fetch(:api_key)).get_weather(city: city)

    self.forecast_today = forecasts.fetch(:today)
    self.forecast_week = forecasts.fetch(:week)
  end

  def send
    client.update(message)
  end

  private

  def message
    str = "#{forecast_today.formatted_temp} e #{forecast_today.description} em #{city} em #{forecast_today.formatted_date}. "
    str << "Média para os próximos dias de: "

    forecast_week.each_with_index do |day, index|
      str << if index == (forecast_week.size - 1)
        "e #{day.formatted_temp} em #{day.formatted_date}."
      else
        "#{day.formatted_temp} em #{day.formatted_date}, "
      end
    end
    str
  end

  def client
    Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token = ENV['TWITTER_ACESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_TOKEN_SECRET']
    end
  end
end
