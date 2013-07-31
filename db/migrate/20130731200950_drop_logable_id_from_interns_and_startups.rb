class DropLogableIdFromInternsAndStartups < ActiveRecord::Migration
  def up
    remove_column :interns, :logable_id, :integer
    remove_column :startups, :logable_id, :integer
  end
end
