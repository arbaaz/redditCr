require "./post"

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

  def self.to_json(_children, json)
    puts _children.to_json
    # puts _children.class
  end
end
