class CreateSlateBlogs < ActiveRecord::Migration
  def up
    create_table :slate_blogs do |t|
      t.string :title
      t.references :author

      t.timestamps
    end
  end

  def down
    drop_table :slate_blogs
  end
end
