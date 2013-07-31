class CreateInternships < ActiveRecord::Migration
  def change
    create_table :internships do |t|
      t.date :start_date
      t.date :end_date
      t.text :position_description
      t.text :requirements
      t.boolean :remuneration

      t.timestamps
    end
  end
end
