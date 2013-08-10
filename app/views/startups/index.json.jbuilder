json.startups(@startups) do |json, startup|
	json.(startup, :company_name, :logo, :founded, :number_of_employees)
	json.(startup.account, :email, :industry, :city, :country, :description)

	json.internships(startup.internships) do |json, internship|
		json.(internship, :start_date, :end_date, :remuneration, :position_description, :requirements)
		json.(internship.internship_contact, :first_name, :last_name, :email)
	end
end



a = [1, 4, 7, 3, 9]
b = []
i=0

a.each do |x|
	if a[i] < a[i+1]
		b << a[i+1]
		i += 1
	else 
		return b[-1]
	end
end
