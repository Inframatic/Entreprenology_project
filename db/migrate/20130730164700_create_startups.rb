class CreateStartups < ActiveRecord::Migration
  def change
    create_table :startups do |t|
      t.string :company_name
      t.string :contact_person
      t.string :contact_person_email
      t.string :industry
      t.string :city
      t.string :country
      t.integer :number_of_employees
      t.string :logo
      t.string :banner
      t.text :description

      t.timestamps
    end
  end
end
