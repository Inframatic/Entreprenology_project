class CreateInternshipContacts < ActiveRecord::Migration
  def change
    create_table :internship_contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email

      t.timestamps
    end
  end
end
