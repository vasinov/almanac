class AddNewFieldsToBlogs < ActiveRecord::Migration
  def up
    change_table :slate_blogs do |t|
      t.text :description
      t.string :twitter
      t.string :google_analytics
    end
  end

  def down
    remove_column :slate_blogs, :description
    remove_column :slate_blogs, :twitter
    remove_column :slate_blogs, :google_analytics
  end
end
