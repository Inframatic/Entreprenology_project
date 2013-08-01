class AddPasswordHashSalt < ActiveRecord::Migration
  def up
    remove_column :accounts, :password_digest, :string
    add_column :accounts, :password_hash, :string
    add_column :accounts, :password_salt, :string
  end
end