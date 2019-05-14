require "json"
require "html"

module ImageUrl
  def self.from_json(pull)
    result = ""
    begin
      pull.on_key!("images") do
        pull.read_array do
          pull.on_key!("source") do
            pull.on_key!("url") do
              result = pull.read_string
            end
          end
        end
      end
    rescue exception
      puts "Found exception:"
      puts exception
    end
    HTML.unescape(result)
  end

  def self.to_json(_preview, json)
    json.string(_preview)
  end
end
