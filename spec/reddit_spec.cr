require "./spec_helper"

describe Reddit do
  # TODO: Write tests

  r = Response.from_json(File.read("spec/fixtures/india.json"))

  it "should print json" do
    puts r.first.to_json
  end

  it "ups should be int" do
    r.map do |obj|
      obj.ups.should be_a(Int32)
      obj.title.should be_a(String)
    end
  end
end
