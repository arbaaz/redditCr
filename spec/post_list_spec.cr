require "./spec_helper"

describe PostList do
  string_or_io = File.read("spec/fixtures/post_list.json")
  pull = JSON::PullParser.new(string_or_io)
  r = PostList.from_json(pull)

  it "id should be string" do
    puts r.to_json
    r.map do |item|
      item.id.should be_a(String)
    end
  end
end
