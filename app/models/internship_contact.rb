class InternshipContact < ActiveRecord::Base

  belongs_to :internship,:dependent => :destroy

  validates :first_name, :last_name, :email, :presence => true
  
end