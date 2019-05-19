require "./spec_helper"

describe Response do
  # TODO: Write tests
  r = Response.from_json(File.read("spec/fixtures/india.json"))

  it "ups should be int" do
    r.children.map do |obj|
      obj.ups.should be_a(Int32)
      obj.title.should be_a(String)
    end
  end

  it "to json" do
    JSON.parse(r.to_json).should be_a(JSON::Any)
  end
end
