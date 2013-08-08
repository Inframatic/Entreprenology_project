class AugmentingAccountsPolymorphicAssociation < ActiveRecord::Migration
  def change
  	remove_column :accounts, :logable_id, :integer
  	remove_column :accounts, :logable_type, :string
  	add_reference :accounts, :logable, polymorphic: true, index: true
  end
end
