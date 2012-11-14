class AddImageFieldsToAlmanacBlogs < ActiveRecord::Migration
  def up
    change_table :almanac_blogs do |t|
      t.string :background_uid
      t.string :logo_uid
    end
  end

  def down
    remove_column :almanac_blogs, :background_uid
    remove_column :almanac_blogs, :logo_uid
  end
end
