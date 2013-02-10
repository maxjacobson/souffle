require 'sinatra'
require 'nokogiri'

def xml_to_hash(xml)
  document = Nokogiri::XML(xml)
  elements = document.xpath("//outline/outline")
  feeds = Hash.new
  elements.each do |el|
    title = el["title"]
    feed = el["xmlUrl"]
    feeds[feed] = title
  end
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