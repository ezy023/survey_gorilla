class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :survey_takers
  has_many :surveys, :foreign_key => :creator_id
  has_many :surveys, :through => :survey_takers
  has_many :responses
end
