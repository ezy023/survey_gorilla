class Survey < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :creator, :class_name => :user
end
