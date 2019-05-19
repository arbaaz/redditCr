require "json"
require "html"

module GifUrl
  def self.from_json(pull)
    result = ""
    begin
      pull.on_key!("images") do
        pull.read_array do
          pull.on_key!("variants") do
            pull.on_key!("gif") do
              pull.on_key!("source") do
                pull.on_key!("url") do
                  result = pull.read_string
                end
              end
            end
          end
        end
      end
    rescue exception
      puts "Found exception: AR"
      puts exception
      result = "https://media.giphy.com/media/xTiN0L7EW5trfOvEk0/giphy.gif"
    end
    HTML.unescape(result)
  end

  def self.to_json(_media_embed, json)
    json.string(_media_embed)
  end
end
