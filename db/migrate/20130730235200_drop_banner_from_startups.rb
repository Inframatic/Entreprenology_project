class DropBannerFromStartups < ActiveRecord::Migration
  def up
    remove_column :startups, :banner, :string
  end
end
