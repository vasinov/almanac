class AddExcerptToSlatePosts < ActiveRecord::Migration
def up
    change_table :slate_posts do |t|
      t.text :excerpt
    end
  end

  def down
    remove_column :slate_posts, :excerpt
  end
end
