class Building < ApplicationRecord
  belongs_to :last_updated_user, :class_name => "User"
  
  has_many :relationships
end
