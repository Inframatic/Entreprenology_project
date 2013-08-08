json.(@startup, :company_name, :logo, :founded, :number_of_employees)
json.(@startup.account, :email, :industry, :city, :country, :description)

json.internships(@startup.internships) do |json, internship|
	json.(internship, :start_date, :end_date, :remuneration, :position_description, :requirements)
	json.(internship.internship_contact, :first_name, :last_name, :email)
end