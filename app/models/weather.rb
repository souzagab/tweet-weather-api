# frozen_string_literal: true

class Weather
  include ActiveModel::Model

  attr_accessor :temp, :date, :description
end
