class Startup < ActiveRecord::Base

  has_one :account, :as => :logable
  has_one :favourited_list, :as => :favouritable
  has_many :internships

  accepts_nested_attributes_for :account
  validates :company_name, :logo, :founded, :presence => true
  validates :number_of_employees, :numericality => {:only_integer => true}
  
end