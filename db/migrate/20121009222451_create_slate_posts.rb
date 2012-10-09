class CreateSlatePosts < ActiveRecord::Migration
  def up
    create_table :slate_posts do |t|
      t.string :title
      t.text :body
      t.boolean :published, :default => false
      t.references :blog
      t.references :author

      t.timestamps
    end
  end

  def down
    drop_table :slate_posts
  end
end
