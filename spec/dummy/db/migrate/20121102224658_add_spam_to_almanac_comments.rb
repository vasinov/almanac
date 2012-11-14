# This migration comes from almanac (originally 20121102185130)
class AddSpamToComments < ActiveRecord::Migration
  def up
    change_table :almanac_comments do |t|
      t.boolean :spam, :default => false
    end
  end

  def down
    remove_column :almanac_comments, :spam
  end
end
