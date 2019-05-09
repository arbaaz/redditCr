require "./post"

module PostList
  def self.from_json(pull)
    result = [] of Post
    pull.read_array do
      pull.on_key!("data") do
        result << Post.new(pull)
      end
    end
    result
  end

  def self.to_json(post_list, json)
    json.start_array
    post_list.each do |post|
      json.object do
        json.field "id", post.id
        json.field "ups", post.ups
        json.field "title", post.title
        json.field "url", post.url
        json.field "permalink", post.permalink
        json.field "preview", post.preview
        json.field "post_hint", post.post_hint
        json.field "media_embed", post.media_embed
      end
    end
    json.end_array
  end
end
