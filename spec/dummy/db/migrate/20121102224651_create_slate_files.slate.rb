# This migration comes from slate (originally 20121017210007)
class CreateSlateFiles < ActiveRecord::Migration
  def up
    create_table :slate_files do |t|
      t.string :image_uid
      t.string :thumb_uid
      t.references :post

      t.timestamps
    end
  end

  def down
    drop_table :slate_files
  end
end
