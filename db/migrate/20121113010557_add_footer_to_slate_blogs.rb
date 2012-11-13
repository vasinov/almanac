class AddFooterToSlateBlogs < ActiveRecord::Migration
  def up
    change_table :slate_blogs do |t|
      t.text :footer
    end
  end

  def down
    remove_column :slate_blogs, :footer
  end
end
