require 'sinatra'
require 'nokogiri'

def interpret_subs(xml)
  document = Nokogiri::XML(xml)
  outlines = document.xpath("//outline")
  folders = Array.new
  outlines.each do |outline|
    if outline.xpath("child::outline").length > 0
      folder = Hash.new
      folder[:title] = outline["title"]
      folder[:feeds] = Array.new
      outline.xpath("child::outline").each do |feed|
        folder[:feeds].push({:title => feed["title"], :url => feed["xmlUrl"]})
      end
      folders.push(folder)
    end
  end
  return folders
end

get '/' do
  erb :upload
end

post '/' do
  @folders = interpret_subs(params[:feed_text].encode('UTF-8'))
  erb :list
end