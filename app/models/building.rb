class Building < ApplicationRecord
  belongs_to :last_updated_user, :class_name => "User"

  has_many :relationships, :dependent => :destroy

  validates :building_number, presence: true, uniqueness: true
end
