unless Rails.env.production?

  require 'nokogiri'
  require 'open-uri'
  require 'pry'

end

task :betfair, [:num] => :environment do |t, args|
  time = Time.now

  page = go_to_betfair_market_activity(args.num)

  puts "#{(Time.now - time) / 60} minutes"
end

def go_to_betfair_market_activity(num)
  url = links[num]
  return Nokogiri::HTML(open(url))
end

def links
  {
    "1" => "https://www.betfair.com/exchange/tennis/marketactivity?id=1.121664234&selectionId=9545182" 
  }
end