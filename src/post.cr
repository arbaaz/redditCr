require "json"
require "./image_url"
require "./media_embed"

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
