class RemoveAkismetFieldsFromBlogs < ActiveRecord::Migration
  def up
    remove_column :almanac_blogs, :rakismet_key
    remove_column :almanac_blogs, :rakismet_url
  end

  def down
    change_table :almanac_blogs do |t|
      t.string :rakismet_key
      t.string :rakismet_url
    end
  end
end
