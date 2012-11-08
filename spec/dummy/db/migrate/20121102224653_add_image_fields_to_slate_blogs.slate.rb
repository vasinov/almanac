# This migration comes from slate (originally 20121025223403)
class AddImageFieldsToSlateBlogs < ActiveRecord::Migration
  def up
    change_table :slate_blogs do |t|
      t.string :background_uid
      t.string :logo_uid
    end
  end

  def down
    remove_column :slate_blogs, :background_uid
    remove_column :slate_blogs, :logo_uid
  end
end
