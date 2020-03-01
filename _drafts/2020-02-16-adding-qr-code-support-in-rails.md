---
layout: post
title: Adding QR Code Support in Rails
category: rails
tags: ["rails", "qr"]
---
{:.center}
![double_facepalm.jpg](/blog/assets/double_facepalm.jpg)

I find myself with the need to generate a QR code to support a feature in an upcoming side project.  Happily there is a [rqrcode gem](https://github.com/whomwah/rqrcode/) which handles the actual image generation and data encoding but how you use it in a production Rails context isn't fully apparent.  And while I know those details are actually trivial, they really do matter. This blog post walks through my perambulating path through making a qr code.

## Step 1: Figure Out the Damn Url

The whole purpose of a QR code is to give a url that someone on a mobile device can use to open the url contained in the QR code without having to type something long on a mobile device's keyboard.  This means that we need a method that gives you the right url for a user.  This is going to vary per application but here's mine:

```ruby
def url
  return "https://netlabeler.com/projects/#{self.id}" if Rails.env.production?
  return "http://localhost:3000/projects/#{self.id}"
end
```

**Note**: this is an instance method on my project object since I want the user to go to the project's show page.  And I'll be calling it from my controller so you will later see an @project.url call.

I'm sure there is a better way to do this but that's what I have.  And one thing is right now I'm at 35,000 feet on Southwest without Internet ...

## Step 2: Encoding the Url into a QR Code

The rqr gem makes this pretty damn easy.  Here's an example:

```ruby
png = qrcode.as_png(
  bit_depth: 1,
  border_modules: 4,
  color_mode: ChunkyPNG::COLOR_GRAYSCALE,
  color: 'black',
  file: nil,
  fill: 'white',
  module_px_size: 6,
  resize_exactly_to: false,
  resize_gte_to: false,
  size: 120
)
@filename = "#{Rails.root}/tmp/qr_#{@project.id}.png"
IO.binwrite(@filename, png.to_s)

```



Now that we have the url, we need to encode it into a QR code.  

https://github.com/heapsource/active_model_otp/wiki/Generate-QR-code-with-rqrcode-gem

