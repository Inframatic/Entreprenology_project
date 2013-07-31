class Startup < ActiveRecord::Base

  has_one :account, :as :logable
  
  validates :company_name, :contact_person, :contact_person_email, :industry, :city, :country, :presence => true
  validates :number_of_employees, :numericality => {:only_integer => true}
end
