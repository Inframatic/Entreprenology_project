class Startup < ActiveRecord::Base

  has_one :account, :as => :logable
  has_many :internships
  
  validates :company_name, :presence => true
  validates :number_of_employees, :numericality => {:only_integer => true}
end