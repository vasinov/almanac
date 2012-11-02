class AddRakismetFieldsToBlogs < ActiveRecord::Migration
  def up
    change_table :slate_blogs do |t|
      t.string :rakismet_key
      t.string :rakismet_url
    end
  end

  def down
    remove_column :slate_blogs, :rakismet_key
    remove_column :slate_blogs, :rakismet_url
  end
end
