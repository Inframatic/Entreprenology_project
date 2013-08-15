json.interns(@interns) do |intern|
	json.(intern, :first_name, :last_name, :dob)
	json.(intern.account, :email, :industry, :city, :country, :description)
end