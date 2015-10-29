unless Rails.env.production?

  require 'capybara'
  require 'rest-client'
  require 'rspec-rails'
  require 'selenium-webdriver'

end

task :william_hill => :environment do |t, args|
  time = Time.now
  Capybara.run_server = false
  Capybara.current_driver = :selenium
  include Capybara::DSL

  client = Selenium::WebDriver::Remote::Http::Default.new
  Capybara.register_driver :selenium do |app|
    client.timeout = 36000
    Capybara::Selenium::Driver.new(app, :browser => :firefox, :http_client => client)
  end

  go_to_william_hill
  puts "#{(Time.now - time) / 60} minutes"
end

def go_to_william_hill
  url = "http://sports.williamhill.com/bet/en-gb/betlive/all"
  visit url
end