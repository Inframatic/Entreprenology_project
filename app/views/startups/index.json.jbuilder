json.array!(@startups) do |json, startup|
	json.(startup, :company_name, :logo, :founded, :number_of_employees)
	json.account startup.account
	# :email, :industry, :city, :country, :description
end