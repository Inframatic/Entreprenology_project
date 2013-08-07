# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@orange = Startup.create!(
  :company_name => "Orange",
  :number_of_employees => "30000",
  :founded => "1997",
  :logo => "N/A"
)


@orange.internships.create!(
  :position_description => "Intern will have to assist in tracking our assets through the city.",
  :requirements => "Candidate should be well versed in spanish.",
  :start_date => "2014-05-10",
  :end_date => "2014-08-30"
  )

@orange.internships.first.create_internship_contact(
  :first_name => "Venkateshwar",
  :last_name => "Raman",
  :email => "vkt.ramanayan@ganeshwar.com"
  )