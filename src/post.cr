require "json"
require "./image_url"
require "./gif_url"

class Post
  JSON.mapping(
    id: String,
    ups: Int32?,
    title: String?,
    url: String?,
    permalink: String?,
    post_hint: String?,
    preview: {type: String?, converter: ImageUrl},
      # preview: {type: String?, converter: GifUrl}
)
end
