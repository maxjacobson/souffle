require 'sinatra'
require 'nokogiri'

def interpret_subs(xml)
  document = Nokogiri::XML(xml)
  outlines = document.xpath("//outline")
  folders = Array.new
  strayfeeds = Array.new
  outlines.each do |outline|
    if outline.xpath("child::outline").length > 0 # a folder
      folder = Hash.new
      folder[:title] = outline["title"]
      folder[:feeds] = Array.new
      outline.xpath("child::outline").each do |feed|
        folder[:feeds].push({:title => feed["title"], :siteurl => feed["htmlUrl"], :feedurl => feed["xmlUrl"]})
      end
      folder[:feeds].sort_by! {|feed| feed[:title].gsub(/^the /i, '').downcase} # sorts the feeds
      folders.push(folder)
    elsif outline.xpath("child::outline").length == 0 and outline.xpath("parent::outline").length == 0
      # a stray, no-folder feed
      strayfeeds.push({:title => outline["title"], :siteurl => outline["htmlUrl"], :feedurl => outline["xmlUrl"]})
    end
  end
  folders.sort_by! { |folder| folder[:title] } # alphabetize folders
  total = strayfeeds.length
  folders.each do |folder|
    total += folder[:feeds].length
  end
  return folders, strayfeeds, total
end

get '/' do
  erb :upload
end

post '/' do
  @folders, @strayfeeds, @total = interpret_subs(params[:feed_text])
  erb :list
end