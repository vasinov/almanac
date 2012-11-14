class AddFooterToAlmanacBlogs < ActiveRecord::Migration
  def up
    change_table :almanac_blogs do |t|
      t.text :footer
    end
  end

  def down
    remove_column :almanac_blogs, :footer
  end
end
