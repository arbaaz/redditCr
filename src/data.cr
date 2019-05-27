require "json"
require "./post"
require "./post_list"

class Data
  JSON.mapping(
    children: {type: Array(Post), converter: PostList},
    after: String?,
    before: String?,
    subreddit: String?
  )
end
