require "json"
require "html"

module MediaEmbed
  def self.from_json(pull)
    begin
      pull.on_key!("content") do
        HTML.unescape(pull.read_string)
      end
    rescue
      nil
    end
  end

  def self.to_json(_media_embed, json)
    json.string(_media_embed)
  end
end
