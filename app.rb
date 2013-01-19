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

file1 = ARGV[0] ||= ""
file2 = ARGV[1] ||= ""

if file1 == "" or file2 == ""
  puts "need to pass two filenames as arguments"
  exit
end

xml1 = File.open(file1).read
xml2 = File.open(file2).read

feeds1 = xml_to_hash(xml1)
feeds2 = xml_to_hash(xml2)
feeds2_a = feeds2.to_a.flatten

puts "Both subscribe to:"
feeds1.each do |f|
  feed = f[0]
  if feeds2_a.include?(feed)
    puts "* #{f[1]}"
  end
end
