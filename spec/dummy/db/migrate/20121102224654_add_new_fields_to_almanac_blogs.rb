# This migration comes from almanac (originally 20121029211221)
class AddNewFieldsToBlogs < ActiveRecord::Migration
  def up
    change_table :almanac_blogs do |t|
      t.text :description
      t.string :twitter
      t.string :google_analytics
    end
  end

  def down
    remove_column :almanac_blogs, :description
    remove_column :almanac_blogs, :twitter
    remove_column :almanac_blogs, :google_analytics
  end
end
