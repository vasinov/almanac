# This migration comes from almanac (originally 20121114043648)
class ChangeDefaultValueForBackgroundTilesInAlmanacBlogs < ActiveRecord::Migration
  def self.up
    change_column :almanac_blogs, :background_tile, :boolean, :default => true
  end

  def self.down

  end
end
