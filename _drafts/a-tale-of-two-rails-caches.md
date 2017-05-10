---
layout: post
title: A Tale of Two (rails) Caches
---

2.3.1 :039 > seconds = Benchmark.realtime do
2.3.1 :040 >     results = PageGithubProject.fetch("https://github.com/nickjj/orats")
2.3.1 :041?>   end
1.3151520000537857
2.3.1 :042 > seconds = Benchmark.realtime do
2.3.1 :043 >     seconds = Benchmark.realtime do^C
2.3.1 :043 > reload!
Reloading...
true
2.3.1 :044 > seconds = Benchmark.realtime do
2.3.1 :045 >     results = PageGithubProject.fetch("https://github.com/nickjj/orats")
2.3.1 :046?>   end
1.1567529999883845

importance of an abstract class

    if html_page_body.nil?
      #
      # Cache variables
      #
      use_cache = true
      cache_duration = 1.hour
      cache = ActiveSupport::Cache::MemoryStore.new(expires_in: cache_duration)
      #cache = ActiveSupport::Cache::FileStore.new(expires_in: cache_duration)
      
      if self.fetch_mechanism == "javascript"
        #
        cache_key = TextCommon.sha_it("javascript_page_fetcher__#{@url}")        
        html_page_body = nil
        html_page_body = cache.read(cache_key) if use_cache
        if html_page_body
          status = :ok
          page = UrlCommon.create_mechanize_page_from_html(url, html_page_body)
          html_page_body = nil # this is a big ass (200k to 500k) string so get rid of it immediately
        elsif html_page_body.nil?
          status, page = JavaScriptPageFetcher.fetch(@url, true)
          cache.write(cache_key, page.body, expires_in: cache_duration) if use_cache
        end
      else
        cache_key = TextCommon.sha_it("mechanize_page_fetcher__#{@url}")        
        html_page_body = nil
        html_page_body = cache.read(cache_key) if use_cache
        if html_page_body
          status = :ok
          page = UrlCommon.create_mechanize_page_from_html(url, html_page_body)
          html_page_body = nil # this is a big ass (200k to 500k) string so get rid of it immediately
        elsif html_page_body.nil?
          status, page = UrlCommon.get_page(@url)
          cache.write(cache_key, page.body, expires_in: cache_duration) if use_cache
        end
      end
    else
      #
      # No caching at all here; data comes in from an alternate path (memoize / reuse previous operation)
      #
      status = :ok
      page = UrlCommon.create_mechanize_page_from_html(url, html_page_body)
    end
    
    https://apidock.com/rails/ActiveSupport/Cache/Store/fetch
    
    https://apidock.com/rails/v4.2.7/ActiveSupport/Cache/Store/read
    
    http://stackoverflow.com/questions/5614389/anyone-know-of-a-caching-plugin-for-ruby-mechanize
    
    https://github.com/vcr/vcr
    
    http://stackoverflow.com/questions/11608127/writing-a-caching-version-of-mechanize
    
    
    with caching:

    Total parsers tested: 20
      Total urls tested: 137
    Total time: 157.58553899999242

    w/o caching
    Total parsers tested: 20
      Total urls tested: 137
    Total time: 179.80213199998252
