class CreateFeedlists < ActiveRecord::Migration
  def change
    create_table :feedlists do |t|
      t.string :name

      t.timestamps
    end
  end
end
