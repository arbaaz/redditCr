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
    preview: {type: String?, converter: ImageUrl},
    post_hint: String?,
    gif: {type: String?, converter: GifUrl, root: "preview"}
  )
end
