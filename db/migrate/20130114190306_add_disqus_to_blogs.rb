class AddDisqusToBlogs < ActiveRecord::Migration
  def up
    change_table :almanac_blogs do |t|
      t.string :disqus_shortname
    end
  end

  def down
    remove_column :almanac_blogs, :disqus_shortname
  end
end
