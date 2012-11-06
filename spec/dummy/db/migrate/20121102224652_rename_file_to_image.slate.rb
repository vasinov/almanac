# This migration comes from slate (originally 20121017221819)
class RenameFileToImage < ActiveRecord::Migration
  def up
    rename_table :slate_files, :slate_images
  end

  def down
    rename_table :slate_images, :slate_files
  end
end
