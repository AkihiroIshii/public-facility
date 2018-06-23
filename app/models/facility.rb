class Facility < ApplicationRecord
  belongs_to :last_updated_user, :class_name => "User"
  
  has_many :relationships, :dependent => :destroy
  
  validates :facility_number, uniqueness: true
end
