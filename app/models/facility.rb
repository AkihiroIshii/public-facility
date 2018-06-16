class Facility < ApplicationRecord
  belongs_to :last_updated_user, :class_name => "User"
end
