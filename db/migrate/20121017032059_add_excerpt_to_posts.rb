class AddExcerptToPosts < ActiveRecord::Migration
def up
    change_table :posts do |t|
      t.text :excerpt
    end
  end

  def down
    remove_column :posts, :excerpt
  end
end
