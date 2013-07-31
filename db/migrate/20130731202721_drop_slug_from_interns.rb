class DropSlugFromInterns < ActiveRecord::Migration
  def up
    remove_column :interns, :slug, :string
  end
end
