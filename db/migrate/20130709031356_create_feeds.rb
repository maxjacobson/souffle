class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :feed_url
      t.string :site_url
      t.string :title
      t.integer :feedlist_id

      t.timestamps
    end
  end
end
