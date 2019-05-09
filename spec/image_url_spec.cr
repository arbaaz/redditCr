require "./spec_helper"

describe ImageUrl do
  string_or_io = File.read("spec/fixtures/image_url.json")
  pull = JSON::PullParser.new(string_or_io)
  r = ImageUrl.from_json(pull)

  it "image url should be string" do
    r.should be_a(String)
  end
end
