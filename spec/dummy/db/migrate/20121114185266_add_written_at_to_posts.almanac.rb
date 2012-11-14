# This migration comes from almanac (originally 20121110000024)
class AddWrittenAtToPosts < ActiveRecord::Migration
  def up
    change_table :almanac_posts do |t|
      t.date :written_at
    end
  end

  def down
    remove_column :almanac_posts, :written_at
  end
end
