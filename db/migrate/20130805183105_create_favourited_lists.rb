class CreateFavouritedLists < ActiveRecord::Migration
  def change
    create_table :favourited_lists do |t|
      t.integer :favouritable_id
      t.string :favouritable_type
      t.integer :favourited_id
      t.timestamps
    end
  end
end
