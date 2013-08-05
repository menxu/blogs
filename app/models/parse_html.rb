require 'net/http'
require 'nokogiri'


host = 'tieba.baidu.com'
path = '/p/2470982948?pid=35923137286#35923137286'

http = Net::HTTP.new(host)    # Create a connection
response = http.get(path)     # Request the file
puts response.msg
html = response.body
doc = Nokogiri::HTML(html)

# 获取页面上所有的链接
doc.css('a').each do |link|
  puts "#{link.content}, #{link['href']}"
end

# 打出 meta-keywords
# puts doc.css('meta[name="keywords"]')[0].content