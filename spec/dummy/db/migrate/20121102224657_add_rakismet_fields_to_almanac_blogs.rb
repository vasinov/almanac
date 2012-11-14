# This migration comes from almanac (originally 20121102181941)
class AddRakismetFieldsToBlogs < ActiveRecord::Migration
  def up
    change_table :almanac_blogs do |t|
      t.string :rakismet_key
      t.string :rakismet_url
    end
  end

  def down
    remove_column :almanac_blogs, :rakismet_key
    remove_column :almanac_blogs, :rakismet_url
  end
end
