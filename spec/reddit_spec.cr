require "./spec_helper"

describe Response do
  # TODO: Write tests
  r = Response.from_json(File.read("spec/fixtures/india.json"))

  it "parsing json" do
    # puts r.to_json
    # JSON.parse(r.to_json).should be_a(JSON::Any)
  end

  it "ups should be int" do
    r.children.map do |obj|
      obj.ups.should be_a(Int32)
      obj.title.should be_a(String)
    end
  end
end
