require "http/client"
require "kemal"
require "uri"
require "./response"

get "/reddit" do |env|
  env.response.headers["Access-Control-Allow-Origin"] = "*"
  query = env.params.query["query"]

  params = HTTP::Params.build do |form|
    form.add "after", env.params.query["after"] rescue nil
    form.add "before", env.params.query["before"] rescue nil
    form.add "limit", env.params.query["count"] rescue "20"
  end

  url = "https://www.reddit.com/r/#{query}.json?#{params}"

  response = HTTP::Client.get url
  if response.status_code == 302
    url = URI.parse response.headers["location"]
    query = url.path.to_s.split('/')[2]
    response = HTTP::Client.get url
  end
  parsed_response = Response.from_json(response.body)
  parsed_response.subreddit = query
  parsed_response.to_json
end

Kemal.config.port = 6001
Kemal.run
