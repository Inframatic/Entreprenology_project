class Internship < ActiveRecord::Base
  
  belong_to :startup
  has_one :internship_contact
end
