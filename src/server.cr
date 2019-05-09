require "http/client"
require "kemal"
require "./response"

get "/:subreddit" do |env|
  env.response.headers["Access-Control-Allow-Origin"] = "*"
  subreddit = env.params.url["subreddit"]
  url = "https://www.reddit.com/r/#{subreddit}.json"
  response = HTTP::Client.get url
  if response.status_code == 302
    url = response.headers["location"]
    response = HTTP::Client.get url
  end
  parsed_response = Response.from_json(response.body)
  parsed_response.to_json
end

Kemal.config.port = 6001
Kemal.run
