# frozen_string_literal: true

RSpec.configure do |config|
  # adds freeze_time, travel, travel_back, travel_to)
  # @see https://api.rubyonrails.org/classes/ActiveSupport/Testing/TimeHelpers.html
  config.include ActiveSupport::Testing::TimeHelpers
end
