class AddPasswordToStartups < ActiveRecord::Migration
  def change
    add_column :startups, :password_digest, :string
  end
end
