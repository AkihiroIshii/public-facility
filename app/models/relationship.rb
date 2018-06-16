class Relationship < ApplicationRecord
  belongs_to :facility
  belongs_to :building
  
  validates :facility_id, presence: true
  validates :building_id, presence: true
end
