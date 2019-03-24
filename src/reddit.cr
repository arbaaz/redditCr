require "json"

module ImageUrl
  def self.from_json(pull)
    result = ""
    begin
      pull.on_key!("images") do
        pull.read_array do
          pull.on_key!("source") do
            pull.on_key!("url") do
              result = pull.read_string
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
    json.string(_preview)
  end
end

module MediaEmbed
  def self.from_json(pull)
    begin
      pull.on_key!("content") do
        pull.read_string
      end
    rescue
      nil
    end
  end

  def self.to_json(_media_embed, json)
    json.string(_media_embed)
  end
end

class Reddit
end

class Post
  JSON.mapping(
    id: String,
    ups: Int32,
    title: String,
    url: String,
    permalink: String,
    preview: {type: String | Nil, converter: ImageUrl},
    post_hint: String?,
    media_embed: {type: String?, converter: MediaEmbed}
  )
end

module Response
  def self.from_json(string_or_io)
    pull = JSON::PullParser.new(string_or_io)
    pull.on_key!("data") do
      Data.new(pull)
    end
  end
end

module PostLIst
  def self.from_json(pull)
    result = [] of Post
    pull.read_array do
      pull.on_key!("data") do
        result << Post.new(pull)
      end
    end
    return result
  end

  def self.to_json(_key, json)
    json.string(_key.to_json)
  end
end

class Data
  JSON.mapping(
    children: {type: Array(Post), converter: PostLIst},
    after: String?,
    before: String?
  )
end
