---
layout: post
title: When is CI not CI - Using Rake to Test a Rails App without Tests
---

    ❯ rake quick_test:test
    Running via Spring preloader in process 4428
    url: http://localhost:3169/symptoms/new

          Tell us your symptoms and how you are feeling

    url: http://localhost:3169/hospitalcapacity

          We need stats on your ventilators, beds and consumables

    url: http://localhost:3169/counties?country_id=91&state_id=14

          CovidNearMe.org

    url: http://localhost:3169/

          CovidNearMe.org

    url: http://localhost:3169/states?country_id=91

          What state are you in?

    url: http://localhost:3169/locations?country_id=15

          www.covidnearme.org -- a web site for tracking COVID-19 near you and gathering data to help fight it including data on hospitals, symptoms, risk and more

    url: http://localhost:3169/locations?country_id=91&state_id=15&county_id=118

          CovidNearMe.org

    url: http://localhost:3169/counties?country_id=91&state_id=106

          CovidNearMe.org

    url: http://localhost:3169/searches/new?zip=46040&commit=Go

          www.covidnearme.org -- a web site for tracking COVID-19 near you and gathering data to help fight it including data on hospitals, symptoms, risk and more

    url: http://localhost:3169/searches/new?zip=94101&commit=Go

          www.covidnearme.org -- a web site for tracking COVID-19 near you and gathering data to help fight it including data on hospitals, symptoms, risk and more

    url: http://localhost:3169/searches/new?zip=US&commit=Go

          www.covidnearme.org -- a web site for tracking COVID-19 near you and gathering data to help fight it including data on hospitals, symptoms, risk and more

    url: http://localhost:3169/searches/new?zip=Italy&commit=Go

          www.covidnearme.org -- a web site for tracking COVID-19 near you and gathering data to help fight it including data on hospitals, symptoms, risk and more

    url: http://localhost:3169/hospital_metrics/new

          We need stats on your ventilators, beds and consumables

    url: http://localhost:3169/hospital_notes/new

          Tell us about your hospital experience, wait times, were you tested or more

    url: http://localhost:3169/hospitalstats

          We need stats on your ventilators, beds and consumables

    url: http://localhost:3169/hospitalnotes

          Tell us about your hospital experience, wait times, were you tested or more

    url: http://localhost:3169/hospitalexperience

          Tell us about your hospital experience, wait times, were you tested or more

    url: http://localhost:3169/countries

          What country are you in?

    url: http://localhost:3169/risk
    rake aborted!
    Mechanize::ResponseCodeError: 500 => Net::HTTPInternalServerError for http://localhost:3169/risk -- unhandled response
    /Users/sjohnson/.rvm/gems/ruby-2.7.0/gems/mechanize-2.7.6/lib/mechanize/http/agent.rb:329:in `fetch'
    /Users/sjohnson/.rvm/gems/ruby-2.7.0/gems/mechanize-2.7.6/lib/mechanize.rb:464:in `get'
    /Users/sjohnson/Sync/coding/rails/covid_morbidity/lib/tasks/quick_test.rake:29:in `block (3 levels) in <main>'
    /Users/sjohnson/Sync/coding/rails/covid_morbidity/lib/tasks/quick_test.rake:27:in `each'
    /Users/sjohnson/Sync/coding/rails/covid_morbidity/lib/tasks/quick_test.rake:27:in `block (2 levels) in <main>'
    /Users/sjohnson/.rvm/gems/ruby-2.7.0/gems/bootsnap-1.4.6/lib/bootsnap/load_path_cache/core_ext/kernel_require.rb:55:in `load'
    /Users/sjohnson/.rvm/gems/ruby-2.7.0/gems/bootsnap-1.4.6/lib/bootsnap/load_path_cache/core_ext/kernel_require.rb:55:in `load'
    -e:1:in `<main>'
    Tasks: TOP => quick_test:test
    (See full trace by running task with --trace)
    
    
  And here's what the error looks like in the browser:
  
    Routing Error
    uninitialized constant RiskController Did you mean? CardsController
    Rails.root: /Users/sjohnson/Sync/coding/rails/covid_morbidity

    Application Trace | Framework Trace | Full Trace
    Routes
    Routes match in priority from top to bottom
    
    
  Before
  
  when :asthma_or_lung_condition
    @lung_conditions = [
      "Asthma",
      "COPD",
      "Vaper",
      "Nope!"
    ]
    
  After
  
  
  when :asthma_or_lung_condition
    @lung_conditions = [
      "Asthma",
      "COPD",
      "Smoker",
      "Vaper",
      "Nope!"
    ]
    
    So remove the change even though you know its right
    
    
    /Users/sjohnson/Sync/coding/rails/covid_morbidity/app/controllers/risk_controller.rb:46: syntax error, unexpected string literal, expecting ']' "Yes", ^ /Users/sjohnson/Sync/coding/rails/covid_morbidity/app/controllers/risk_controller.rb:46: syntax error, unexpected ',', expecting `end' "Yes", ^ /Users/sjohnson/Sync/coding/rails/covid_morbidity/app/controllers/risk_controller.rb:48: syntax error, unexpected ']', expecting `end' ] ^ /Users/sjohnson/Sync/coding/rails/covid_morbidity/app/controllers/risk_controller.rb:63: syntax error, unexpected `when', expecting `end' when :heart_condition ^~~~ /Users/sjohnson/Sync/coding/rails/covid_morbidity/app/controllers/risk_controller.rb:69: syntax error, unexpected `when', expecting `end' when :age ^~~~ /Users/sjohnson/Sync/coding/rails/covid_morbidity/app/controllers/risk_controller.rb:88: syntax error, unexpected `end', expecting end-of-input
    
    
    
    
    when :asthma_or_lung_condition
      @lung_conditions = [
        "Asthma",
        "COPD",
        "Smoker",
        #"Vaper",
        "Nope!"
      ]
    when :sex
      @sexes = [
        "Male",
        "Female",
        "Intersex"
      ]
    when :diabetes
      @diabetes = [
        "Yes",
        "Nope!"
      ]
    when :high_blood_pressure
      @high_blood_pressure = [
        "Yes",
        "Nope!"
      ]
      
      look next to diabetes
      
      
And now a clean build:

    ❯ rake quick_test:test
    Running via Spring preloader in process 6910
    url: http://localhost:3169/symptoms/new

          Tell us your symptoms and how you are feeling

    url: http://localhost:3169/hospitalcapacity

          We need stats on your ventilators, beds and consumables

    url: http://localhost:3169/counties?country_id=91&state_id=14

          CovidNearMe.org

    url: http://localhost:3169/

          CovidNearMe.org

    url: http://localhost:3169/states?country_id=91

          What state are you in?

    url: http://localhost:3169/locations?country_id=15

          www.covidnearme.org -- a web site for tracking COVID-19 near you and gathering data to help fight it including data on hospitals, symptoms, risk and more

    url: http://localhost:3169/locations?country_id=91&state_id=15&county_id=118

          CovidNearMe.org

    url: http://localhost:3169/counties?country_id=91&state_id=106

          CovidNearMe.org

    url: http://localhost:3169/searches/new?zip=46040&commit=Go

          www.covidnearme.org -- a web site for tracking COVID-19 near you and gathering data to help fight it including data on hospitals, symptoms, risk and more

    url: http://localhost:3169/searches/new?zip=94101&commit=Go

          www.covidnearme.org -- a web site for tracking COVID-19 near you and gathering data to help fight it including data on hospitals, symptoms, risk and more

    url: http://localhost:3169/searches/new?zip=US&commit=Go

          www.covidnearme.org -- a web site for tracking COVID-19 near you and gathering data to help fight it including data on hospitals, symptoms, risk and more

    url: http://localhost:3169/searches/new?zip=Italy&commit=Go

          www.covidnearme.org -- a web site for tracking COVID-19 near you and gathering data to help fight it including data on hospitals, symptoms, risk and more

    url: http://localhost:3169/hospital_metrics/new

          We need stats on your ventilators, beds and consumables

    url: http://localhost:3169/hospital_notes/new

          Tell us about your hospital experience, wait times, were you tested or more

    url: http://localhost:3169/hospitalstats

          We need stats on your ventilators, beds and consumables

    url: http://localhost:3169/hospitalnotes

          Tell us about your hospital experience, wait times, were you tested or more

    url: http://localhost:3169/hospitalexperience

          Tell us about your hospital experience, wait times, were you tested or more

    url: http://localhost:3169/countries

          What country are you in?

    url: http://localhost:3169/risk

          Assess your personal risk from COVID-19

    url: http://localhost:3169/about

          CovidNearMe.org
    