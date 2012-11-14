# This migration comes from slate (originally 20121112205256)
class AddBackgroundFieldsToBlogs < ActiveRecord::Migration
  def up
    change_table :slate_blogs do |t|
      t.boolean :background_tile, :default => false
      t.integer :background_blur, :default => 0
    end
  end

  def down
    remove_column :slate_blogs, :background_tile
    remove_column :slate_blogs, :background_blur
  end
end
