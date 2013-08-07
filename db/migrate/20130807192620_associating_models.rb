class AssociatingModels < ActiveRecord::Migration
  def up
  	add_reference :internships, :startup
  	add_reference :internship_contacts, :internship
  	remove_column :accounts, :logable_id, :integer
  	remove_column :accounts, :logable_type, :string
  	add_reference :accounts, :logable, :polymorphic => true
  end
end
