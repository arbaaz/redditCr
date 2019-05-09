require "json"
require "./data"

module Response
  def self.from_json(string_or_io)
    pull = JSON::PullParser.new(string_or_io)
    pull.on_key!("data") do
      Data.new(pull)
    end
  end
end
