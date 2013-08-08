json.array!(@interns) do |json, intern|
	json.(intern, :first_name, :last_name, :dob)
	json.account intern.account
	# :email, :industry, :city, :country, :description
end