---
layout: post
title: Loading Zip Codes with SmarterCSV Gem
category: rails
tags: ["rails", "csv", "covidnearme.org"]
---
{:.center}
![IMG_2664.jpeg](/blog/assets/IMG_2664.jpeg)

Zip code data is always problematic due to the leading zeros.  The [smarter_csv](https://github.com/tilo/smarter_csv) gem in Rails defaults to automatically handling numbers as numerics, not strings, which means that you lose 00408 to just 408.  Here's an example of a work around using a rake task to load data:

```ruby
# bundle exec rake data:import_geography --trace
task :import_geography => :environment do
  path = File.join(Rails.root, 'lib/tasks/data/', 'Geocodes_USA_with_Counties.csv')
  
  geographies = SmarterCSV.process(path, { 
    hash_transformations: [ :convert_values_to_numeric_unless_leading_zeros], 
    convert_values_to_numeric: { except: [:zip] }} )
  
  geographies.each do |g|
    g_obj = Geography.find_or_create(g)
  end
end
```

**Note**: This wasn't the [accepted work around](https://github.com/tilo/smarter_csv/issues/151) but a hack; sigh.  The :convert_values_to_numeric_unless_leading_zeros transformation doesn't seem work.  Issue filed; I hope to fix this myself down the road.