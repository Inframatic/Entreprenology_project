class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :dob
      t.string :industry
      t.string :email
      t.string :country
      t.string :city

      t.timestamps
    end
  end
end
