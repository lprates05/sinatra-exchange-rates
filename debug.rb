require "sinatra"
require "sinatra/reloader"
require "dotenv/load"
ENV.fetch("MY_KEY")
require "http"

api_url = "https://api.exchangerate.host/list?access_key=#{ENV.fetch("MY_KEY")}"
  raw_response = HTTP.get(api_url)
  parsed_data = JSON.parse(raw_response.body.to_s)
  currencies = parsed_data.fetch("currencies")
  currency_codes = currencies.keys.sort

  # Debug output printed in the terminal when the route is accessed
  puts "Currency Codes: " + currency_codes.inspect


