class Survey < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :creator, :class_name => :user
  has_many :questions


  mount_uploader :image, Uploader


  has_many :survey_takers
  has_many :users, :through => :survey_takers

end
