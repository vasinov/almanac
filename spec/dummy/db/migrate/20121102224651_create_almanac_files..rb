# This migration comes from almanac (originally 20121017210007)
class CreateAlmanacFiles < ActiveRecord::Migration
  def up
    create_table :almanac_files do |t|
      t.string :image_uid
      t.string :thumb_uid
      t.references :post

      t.timestamps
    end
  end

  def down
    drop_table :almanac_files
  end
end
