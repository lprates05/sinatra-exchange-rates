require "sinatra"
require "sinatra/reloader"
require "dotenv/load"
ENV.fetch("MY_KEY")
require "http"

get("/") do
 
  api_url = "https://api.exchangerate.host/list?access_key=#{ENV.fetch("MY_KEY")}"
  
  @raw_response = HTTP.get(api_url)
  @raw_string = @raw_response.to_s
  @parsed_data = JSON.parse(@raw_string)
  
  erb(:homepage)
  
  @currencies = @parsed_data.fetch("currencies")

end
