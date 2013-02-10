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
