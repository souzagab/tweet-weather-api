# frozen_string_literal: true

require "spec_helper"
ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../config/environment", __dir__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require "rspec/rails"

RSpec.configure do |config|
  config.use_active_record = false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end

Shoulda::Matchers.configure do |c|
  c.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

VCR.configure do |c|
  c.define_cassette_placeholder("<API_KEY>", ENV["OPEN_WEATHER_KEY"])
  c.cassette_library_dir = "spec/cassettes"
  c.configure_rspec_metadata!
  c.hook_into :webmock

  c.default_cassette_options = {
    record: :new_episodes,
    match_requests_on: [
      :method,
      VCR.request_matchers.uri_without_param(:appid),
    ],
  }

  c.before_record do |record|
    if ENV.key?("OPEN_WEATHER_KEY")
      record.request.uri.gsub!(ENV["OPEN_WEATHER_KEY"],
                               "api-key")
    end
    record.response.body.force_encoding("UTF-8")
  end
end

Dir[Rails.root.join("spec", "support", "**", "*.rb")].sort.each do |f|
  require f
end
