class ChangeTypeDobFromStringToDate < ActiveRecord::Migration
  def change
  	change_column :interns, :dob, :date
  end
end
