class Feed < ActiveRecord::Base
  attr_accessible :feed_url, :feedlist_id, :site_url, :title
  belongs_to :feedlist
end
