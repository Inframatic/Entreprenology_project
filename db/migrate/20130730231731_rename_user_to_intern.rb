class RenameUserToIntern < ActiveRecord::Migration
  def change
    rename_table :users, :interns
  end
end
