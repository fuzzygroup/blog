---
layout: post
title: When to Use a Helper Method in Rails
---

```ruby
def display_labeled_data(label)
  return if label.extracted_data.nil?
  return if label.extracted_data.keys.nil?
  keys = label.extracted_data.keys
  output = []
  keys.each do |key|
    output << "<p>"
    output << key
    output << ":"
    tmp = label.extracted_data[key]
    if tmp
      tmp = tmp.gsub(/\n/,'<br/>')
    end
    output << tmp
    output << "</p>"
  end
  output.join("\n").html_safe
end
```