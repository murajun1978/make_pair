require 'open-uri'
require 'nokogiri'

event_url = ARGV[0]
doc = Nokogiri::HTML(open(event_url))

members = doc.css(".user-name").map {|user| user.children.text}.shuffle
team_name = "@"

members.each_slice(2) do |user1, user2|
  puts "チーム#{team_name.next!}は'#{user1}'さんと'#{user2}'さん"
end
