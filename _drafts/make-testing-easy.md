---
layout: post
title: Make Testing Easy
---
 bundle exec rake crawl2016_q4:test_crawl --trace


After crawling site: 457, domain: lowrystate.com there were:
      pages_count: 43 | 46 (prior)
      links_count: 1337 | 1333 (prior)
page_bodies_count: 43 | 46 (prior)
      forms_count: 0 | 3 (prior)
    iframes_count: 1 | 0 (prior)
unique_urls_count: 152 | 73 (prior)
Total crawl time: 79.70658148999792 | seconds_per_page: 1.8536414299999515


Tests for writing to the WRONG table -- In the q3 data set there are:
        q3_pages: 0
        q3_links: 0
        q3_forms: 0
      q3_iframes: 0
  q3_unique_urls: 74
  q3_page_bodies: 0
MAJOR ERROR - The q3 calls above should be 0

After crawling site: 457, domain: lowrystate.com there were:
      pages_count: 43 | 46 (prior)
      links_count: 1337 | 1333 (prior)
page_bodies_count: 43 | 46 (prior)
      forms_count: 0 | 3 (prior)
    iframes_count: 1 | 0 (prior)
unique_urls_count: 74 | 73 (prior)
Total crawl time: 119.04229378001764 | seconds_per_page: 2.768425436744596


Tests for writing to the WRONG table -- In the q3 data set there are:
        q3_pages: 0
        q3_links: 0
        q3_forms: 0
      q3_iframes: 0
  q3_unique_urls: 0
  q3_page_bodies: 0
No crawling into the q3 data so good!