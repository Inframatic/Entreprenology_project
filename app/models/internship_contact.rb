class InternshipContact < ActiveRecord::Base

  belongs_to :internship

  validates :first_name, :last_name, :email, :presence => true
end