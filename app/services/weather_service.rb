class WeatherService
  attr_accessor :client, :city

  def initialize(api_key:)
    self.client = Ropenweather::Client.new(api_key: api_key, lang: "pt_BR")
  end

  def get_weather(city:)
    self.city = city
    { today: current, week: forecasts }
  end

  private

  def current
    response = client.current_weather(city: city)

    Weather.new(date: Date.current,
                temp: response[:main][:temp].to_f.round,
                description: response[:weather].first[:description])
  end

  def forecasts
    response = client.current_weather(city: city, action: "forecast")

    averages = []

    time_gap.each do |date|
      filtered_list = response[:list].select do |item|
        item[:dt_txt].to_date == date
      end

      averages << Weather.new(date: date,
                              temp: daily_average(filtered_list))
    end

    averages
  end

  def time_gap
    start = 1.day.since.to_date
    (start..5.days.since).to_a
  end

  def daily_average(list)
    temperatures = list.map { |item| item[:main][:temp].to_f }

    (temperatures.reduce(:+) / temperatures.size).round
  end
end
