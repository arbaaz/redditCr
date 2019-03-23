require "json"

module Response
  def self.from_json(string_or_io)
    pull = JSON::PullParser.new(string_or_io)
    result = [] of Post
    pull.on_key!("data") do
      pull.on_key!("children") do
        pull.read_array do
          pull.on_key!("data") do
            result << Post.new(pull)
          end
        end
      end
    end
    return result
  end
end

module ImageUrl
  def self.from_json(value)
    result = ""
    begin
      value.on_key!("images") do
        value.read_array do
          value.on_key!("source") do
            value.on_key!("url") do
              result = value.read_string
            end
          end
        end
      end
    rescue exception
      puts "Found exception:"
      puts exception
    end
    result
  end

  def self.to_json(_preview, json)
    String.build do |io|
      json.field "preview", "value"
    end
  end
end

class Reddit
end

class Post
  JSON.mapping(
    id: String?,
    ups: Int32,
    title: String,
    url: String?,
      # preview: {type: String, default: "http://placeholder.com", converter: ImageUrl}
)
end
