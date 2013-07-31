class ChangeUserMasterToAccount < ActiveRecord::Migration
  def change
    rename_table :master_users, :accounts
  end
end
