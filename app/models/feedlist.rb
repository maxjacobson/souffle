class Feedlist < ActiveRecord::Base
  attr_accessible :name, :feed_text
  attr_accessor :total
  has_many :feeds

  def feed_text=(xml)
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
          folder[:feeds].push(outline_to_hash(feed))
        end
        folder[:feeds].sort_by! {|feed| feed[:title].gsub(/^the /i, '').downcase} # sorts the feeds
        folders.push(folder)
      elsif outline.xpath("child::outline").length == 0 and outline.xpath("parent::outline").length == 0
        # a stray, no-folder feed
        strayfeeds.push(outline_to_hash(outline))
      end
    end
    folders.sort_by! { |folder| folder[:title] } # alphabetize folders
    total = strayfeeds.length
    folders.each do |folder|
      total += folder[:feeds].length
    end



    @total = total

    folders.each do |folder|
    	folder[:feeds].each do |feed|
    		self.feeds << Feed.new(feed)
    	end
    end

    strayfeeds.each do |feed|
    	self.feeds << Feed.new(feed) unless self.feeds.any?{|fd| fd.site_url == feed[:site_url]}
    end

  end

  private

  def outline_to_hash(outline)
    return {
      :title => outline["title"],
      :site_url => outline["htmlUrl"],
      :feed_url => outline["xmlUrl"]
    }
  end

end