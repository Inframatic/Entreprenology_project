class DropTypeFromAccount < ActiveRecord::Migration
  def up
    remove_column :accounts, :type, :string
  end
end
