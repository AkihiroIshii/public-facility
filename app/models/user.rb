class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :facilities, :class_name => "Facility", :foreign_key => 'last_updated_user_id'
  has_many :buildings, :class_name => "Building", :foreign_key => 'last_updated_user_id'
end
