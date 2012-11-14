class ChangeDefaultValueForBackgroundTilesInSlateBlogs < ActiveRecord::Migration
  def self.up
    change_column :slate_blogs, :background_tile, :default => true
  end

  def self.down

  end
end
