class AddFoundedToStartups < ActiveRecord::Migration
  def change
    add_column :startups, :founded, :integer
  end
end
