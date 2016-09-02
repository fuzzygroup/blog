files = Dir.glob("*")
output = []
output << "{:.center}"

# Example
#![taking_on_phoenix_screen_01.png](/blog/assets/taking_on_phoenix_screen_01.png)

files.each do |file|
  output << "![#{file}](/blog/assets/elixircon/#{file})"
  output << ""
end

puts output.join("\n")