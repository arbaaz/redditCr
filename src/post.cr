require "json"
require "html"
require "./image_url"
require "./gif_url"

module Media
  def self.from_json(pull)
    begin
      pull.on_key!("content") do
        HTML.unescape(pull.read_string)
      end
    rescue exception
    end
  end

  def self.to_json(_media, json)
    json.string(_media)
  end
end

class Post
  JSON.mapping(
    id: String,
    ups: Int32?,
    title: String?,
    url: String?,
    permalink: String?,
    post_hint: String?,
    media_embed: {type: String?, converter: Media},
    preview: {type: String?, converter: ImageUrl},
      # preview: {type: String?, converter: GifUrl}
)
end
