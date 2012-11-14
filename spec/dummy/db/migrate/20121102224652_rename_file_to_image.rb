# This migration comes from almanac (originally 20121017221819)
class RenameFileToImage < ActiveRecord::Migration
  def up
    rename_table :almanac_files, :almanac_images
  end

  def down
    rename_table :almanac_images, :almanac_files
  end
end
