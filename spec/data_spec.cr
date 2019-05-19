require "./spec_helper"

describe Data do
  string_or_io = File.read("spec/fixtures/data.json")
  r = Data.from_json(string_or_io)

  it "after should be string" do
    r.after.should be_a(String)
  end
end
