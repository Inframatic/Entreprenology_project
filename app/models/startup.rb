class Startup < ActiveRecord::Base

  has_secure_password
  validates_presence_of :password, :on => :create
  
  validates :company_name, :contact_person, :contact_person_email, :industry, :city, :country, :presence => true
  validates :number_of_employees, :numericality => {:only_integer => true}
end
