class Internship < ActiveRecord::Base

  belong_to :startup
  has_one :internship_contact

  validates :start_date, :end_date, :position_description, :remuneration, :presence => true
end