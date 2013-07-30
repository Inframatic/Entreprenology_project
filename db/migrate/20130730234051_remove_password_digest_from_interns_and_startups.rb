class RemovePasswordDigestFromInternsAndStartups < ActiveRecord::Migration
  def up
    remove_column :interns, :password_digest, :string
    remove_column :startups, :password_digest, :string
  end

  def down
  end
end
