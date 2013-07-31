class CreateMasterUsers < ActiveRecord::Migration
  def change
    create_table :master_users do |t|
      t.string :email
      t.string :password_digest
      t.string :industry
      t.string :country
      t.string :city
      t.string :zip_code
      t.text :description

      t.timestamps
    end
  end
end
