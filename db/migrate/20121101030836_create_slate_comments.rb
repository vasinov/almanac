class CreateSlateComments < ActiveRecord::Migration
  def up
    create_table :slate_comments do |t|
      t.text :body
      t.string :author_email
      t.string :author_name
      t.references :post

      t.timestamps
    end
  end

  def down
    drop_table :slate_comments
  end
end
