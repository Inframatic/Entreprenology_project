class AddTypeToAccounts < ActiveRecord::Migration
  def up
    add_column :accounts, :type, :string
  end
end
