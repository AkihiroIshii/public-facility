class Building < ApplicationRecord
  belongs_to :last_updated_user, :class_name => "User"
  
  has_many :relationships, :dependent => :destroy
  
  validates :building_number, uniqueness: true
end
