require 'sinatra'
require 'nokogiri'

def xml_to_hash(xml)
  document = Nokogiri::XML(xml)
  elements = document.xpath("//outline/outline")
  feeds = Array.new
  elements.each do |elem|
    feeds.push({:title => elem["title"], :feed => elem["xmlUrl"]})
  end
  puts feeds
  return feeds
end

get '/' do
  erb :upload
end

post '/' do
  @feeds = xml_to_hash(params[:feed_text].encode('UTF-8'))
  puts @feeds
  erb :list
end