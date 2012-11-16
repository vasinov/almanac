# This migration comes from almanac (originally 20121116194902)
class AddIndexToAlmanacPostsOnSlug < ActiveRecord::Migration
  def up
    add_index :almanac_posts, :slug, unique: true
  end
   def down
   end
end
