class TransferToUserFromInternsStartups < ActiveRecord::Migration
  def up
    remove_column :interns, :email, :string
    remove_column :interns, :city, :string
    remove_column :interns, :country, :string
    remove_column :interns, :industry, :string
    remove_column :startups, :city, :string
    remove_column :startups, :country, :string
    remove_column :startups, :industry, :string
    remove_column :startups, :description, :string
  end

  def down

  end
end
