require "./spec_helper"

describe GifUrl do
  string_or_io = File.read("spec/fixtures/gif_url.json")
  pull = JSON::PullParser.new(string_or_io)
  r = GifUrl.from_json(pull)

  # puts r.to_json

  it "gif url should be string" do
    r.should be_a(String)
  end
end
