require "json"
require "./post"
require "./post_list"

class Data
  JSON.mapping(
    children: {type: Array(Post), converter: PostLIst},
    after: String?,
    before: String?
  )
end
