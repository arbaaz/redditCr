require "./spec_helper"

describe PostLIst do
  string_or_io = File.read("spec/fixtures/post_list.json")
  pull = JSON::PullParser.new(string_or_io)
  r = PostLIst.from_json(pull)

  it "id should be string" do
    r.map do |item|
      item.id.should be_a(String)
    end
  end
end
