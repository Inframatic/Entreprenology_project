class MakeAccountPolymorphicAsLogable < ActiveRecord::Migration
  def change
    add_column :accounts, :logable_id, :integer
    add_column :accounts, :logable_type, :string
    add_column :interns, :logable_id, :integer
    add_column :startups, :logable_id, :integer
  end
end
