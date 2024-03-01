class CreateBookmarks < ActiveRecord::Migration[7.1]
  def change
    create_table :bookmarks do |t|
      t.references :resource, null: false, foreign_key: true

      t.timestamps
    end
  end
end
