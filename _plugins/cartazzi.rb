module Jekyll
  class Cartazzi < Converter
    safe true
    priority :low

    def matches(ext)
      return true
      ext =~ /^\.upcase$/i
    end

    def output_ext(ext)
      ".json"
    end

    def convert(content)
      content.upcase
      # return "fuck"
      # #raise content.inspect
      # #content.upcase
      # output = {}
      # output["body"] = content.to_json
      # output["full_url"] = ''
      # return output.to_json
    end
  end
end