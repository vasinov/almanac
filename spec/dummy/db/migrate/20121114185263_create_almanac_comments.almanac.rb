# This migration comes from almanac (originally 20121101030836)
class CreateAlmanacComments < ActiveRecord::Migration
  def up
    create_table :almanac_comments do |t|
      t.text :body
      t.string :author_email
      t.string :author_name
      t.references :post

      t.timestamps
    end
  end

  def down
    drop_table :almanac_comments
  end
end
