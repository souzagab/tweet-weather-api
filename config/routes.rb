# frozen_string_literal: true

Rails.application.routes.draw do
  post "/tweet", to: "tweets#create"
end
