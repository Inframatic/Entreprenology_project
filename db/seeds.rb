# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
@tim_burton = Intern.create!(
  :first_name => "Timothy",
  :last_name => "Burton",
  :dob => "1970-06-10"
)

@tim_burton.create_account(
  :email => "t.bizzle@gdrizzle.com",
  :industry => "Films",
  :country => "U.S.A.",
  :city => "L.A.",
  :postal_code => "90210",
  :description => "Darkness finds me and tells me to do things, like setting my tablecloth on fire...."
)

@yeezus = Intern.create!(
  :first_name => "Kenneth",
  :last_name => "Norwest",
  :dob => "1980-12-25"
)

@yeezus.create_account(
  :email => "yeezy@west.com",
  :industry => "Music",
  :country => "U.S.A.",
  :city => "L.A.",
  :postal_code => "90210",
  :description => "I've established myself in the music industry but I want to expand my horizons"
)

@orange = Startup.create!(
  :company_name => "Orange.co",
  :number_of_employees => 30000,
  :founded => "1997",
  :logo => "N/A"
)

@orange.create_account(
  :email => "sup@orange.co",
  :industry => "Banking",
  :country => "U.S.A.",
  :city => "Colorado",
  :postal_code => "32098",
  :description => "We are the leading banking firm in the world, but we need interns. So holla at us if you down homie!"
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

@cherry = Startup.create!(
  :company_name => "Cherry Inc.",
  :number_of_employees => 9018,
  :founded => "2000",
  :logo => "N/A"
)

@cherry.create_account(
  :email => "come.talk.to.me@cherry.io",
  :industry => "Food",
  :country => "Barbados",
  :city => "Bridgetown",
  :postal_code => "8",
  :description => "We supply cherries to half the world and want to expand to grapes!"
)

@cherry.internships.create!(
  :start_date => "2014-10-02",
  :end_date => "2014-08-20",
  :position_description => "The intern will have to carry the cherries to people's doors all day.",
  :requirements => "Strong physique, endurance and a couple of masters degrees.",
  :remuneration => false
)

@cherry.internships.first.create_internship_contact(
  :first_name => "Trillo",
  :last_name => "Guillermo",
  :email => "t_gizzle@cherry.in"
)