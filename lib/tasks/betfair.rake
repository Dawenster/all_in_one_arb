task :betfair, [:num] => :environment do |t, args|
  time = Time.now

  url = links[args.num]
  page = Nokogiri::HTML(RestClient.get(url))

  login

  puts "#{(Time.now - time) / 60} minutes"
end

def links
  {
    # "1" => "https://www.betfair.com/exchange/tennis/marketactivity?id=1.121664234&selectionId=9545182" 
    "1" => "https://www.betfair.com/exchange"
  }
end

def login
  page.css("#ssc-liu")
end