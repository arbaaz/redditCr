require "http/client"
require "kemal"
require "./reddit"

get "/:subreddit" do |env|
  env.response.headers["Access-Control-Allow-Origin"] = "*"
  subreddit = env.params.url["subreddit"]
  response = HTTP::Client.get "https://www.reddit.com/r/#{subreddit}.json"
  # parsed_response = Response.from_json(response.body)
  # parsed_response.to_json
end

Kemal.config.port = 6001
Kemal.run
