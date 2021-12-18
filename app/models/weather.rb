# frozen_string_literal: true

class Weather
  include ActiveModel::Model

  attr_accessor :temp, :date, :description

  def formatted_date
    date.strftime("%d/%m")
  end

  def formatted_temp
    "#{temp.to_f.round}°C"
  end
end
