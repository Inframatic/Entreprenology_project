class DropContactAndEmailFromStartupsAndInterns < ActiveRecord::Migration
  def up
    remove_column :startups, :contact_person, :string
    remove_column :startups, :contact_person_email, :string
  end

  def down
  end
end
